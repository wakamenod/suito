package jobs

import (
	"context"
	"fmt"
	"os"
	"testing"

	"firebase.google.com/go/v4/auth"
	"github.com/joho/godotenv"
	"github.com/pkg/errors"
	"github.com/spf13/viper"
	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/api/repositories"
	"github.com/wakamenod/suito/client"
	"github.com/wakamenod/suito/integrationtest"
	"github.com/wakamenod/suito/log"
	"github.com/wakamenod/suito/model"
	"github.com/wakamenod/suito/utils/testutils"
	"go.uber.org/zap"
	"google.golang.org/api/iterator"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	gormlogger "gorm.io/gorm/logger"
	"moul.io/zapgorm2"
)

func initLogger() error {
	viper.SetConfigFile("../config/config.test.toml")
	if err := viper.ReadInConfig(); err != nil {
		return errors.Wrap(err, "config read error")
	}

	outPath := viper.GetString("log.log")
	errPath := viper.GetString("log.err_log")
	level := viper.GetString("log.level")
	c := log.LogConfig{
		OutPath: outPath,
		ErrPath: errPath,
		Level:   level,
	}
	if err := log.Init(c); err != nil {
		return errors.Wrap(err, "failed to init logger")
	}

	return nil
}

func TestGetFirebaseUsers(t *testing.T) {
	integrationtest.SkipIfShort(t)

	require.NoError(t, initLogger())
	require.NoError(t, godotenv.Load("../../.env.suito"))
	require.NoError(t, os.Setenv("GOOGLE_APPLICATION_CREDENTIALS", "../firebase-adminsdk.json"))

	authClient := client.NewFirebaseAuthClient()
	job := newDeleteUserJob(authClient, nil)
	res, err := job.fetchFirebaseUsers()
	require.NoError(t, err)
	require.True(t, res[os.Getenv("FIREBASE_UID")])
}

type userQueue []*auth.ExportedUserRecord

func (q *userQueue) deq() *auth.ExportedUserRecord {
	if len(*q) == 0 {
		return nil
	}

	res := (*q)[0]
	*q = (*q)[1:]
	return res
}

func TestGetFirebaseUsers_Mock(t *testing.T) {
	q := userQueue{
		&auth.ExportedUserRecord{UserRecord: &auth.UserRecord{UserInfo: &auth.UserInfo{UID: "user1"}}},
		&auth.ExportedUserRecord{UserRecord: &auth.UserRecord{UserInfo: &auth.UserInfo{UID: "user2"}}},
		&auth.ExportedUserRecord{UserRecord: &auth.UserRecord{UserInfo: &auth.UserInfo{UID: "user3"}}},
	}
	authIteratorMock := client.AuthUserIteratorMock{
		NextFunc: func() (*auth.ExportedUserRecord, error) {
			res := q.deq()
			if res == nil {
				return nil, iterator.Done
			}
			return res, nil
		},
	}

	authClientMock := &client.AuthClientMock{
		UsersFunc: func(ctx context.Context, nextPageToken string) client.AuthUserIterator {
			return &authIteratorMock
		},
	}
	job := newDeleteUserJob(authClientMock, nil)
	res, err := job.fetchFirebaseUsers()
	require.NoError(t, err)
	require.Equal(t, 3, len(res))
}

func TestGetFirebaseUsers_MockError(t *testing.T) {
	authIteratorMock := client.AuthUserIteratorMock{
		NextFunc: func() (*auth.ExportedUserRecord, error) {
			return nil, errors.New("unknown error")
		},
	}

	authClientMock := &client.AuthClientMock{
		UsersFunc: func(ctx context.Context, nextPageToken string) client.AuthUserIterator {
			return &authIteratorMock
		},
	}
	job := newDeleteUserJob(authClientMock, nil)
	_, err := job.fetchFirebaseUsers()
	require.Error(t, err)
}

var testDB *gorm.DB

// TODO openDB...
func openDB() error {
	if err := godotenv.Load("../../.env.suito"); err != nil {
		return errors.Wrap(err, "failed to load env file")
	}
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8mb4&parseTime=True",
		os.Getenv("DB_USER"),
		os.Getenv("DB_PASS"),
		os.Getenv("DB_HOST"),
		os.Getenv("DB_PORT"),
		os.Getenv("DB_NAME_TEST"),
	)
	err := initLogger()
	if err != nil {
		return err
	}
	logger := zapgorm2.New(zap.L())
	logger.SetAsDefault()
	logger.LogLevel = gormlogger.Info
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{
		Logger: logger,
	})
	if err != nil {
		return errors.Wrap(err, "failed to open test DB")
	}
	testDB = db
	return nil
}

func begin() *gorm.DB {
	if err := openDB(); err != nil {
		log.Fatal("open DB err", log.Fields{"err": err})
	}
	tx := testDB.Begin()
	if tx.Error != nil {
		log.Fatal("begin transaction err", log.Fields{"err": tx.Error})
	}
	return tx
}

func rollback(tx *gorm.DB) {
	if err := tx.Rollback().Error; err != nil {
		log.Fatal("rollback err", log.Fields{"err": err})
	}
}

func TestDoDeleteUserJob(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	i := testutils.NewTestDataInserter(t, tx)
	user1 := i.InsertUser("user1", gorm.DeletedAt{})
	user2 := i.InsertUser("user2", gorm.DeletedAt{})
	userDeleted := i.InsertUser("user_deleted", gorm.DeletedAt{})
	{
		i.InsertExpense(user1.UID, "2023-05-01", "Expense 1")
		i.InsertExpense(user2.UID, "2023-05-01", "Expense 2")
		i.InsertExpense(userDeleted.UID, "2023-05-01", "Expense 3")
	}
	{
		i.InsertIncome(user1.UID, "2023-05-01", "Income 1")
		i.InsertIncome(user2.UID, "2023-05-01", "Income 2")
		i.InsertIncome(userDeleted.UID, "2023-05-01", "Income 3")
	}
	{
		i.InsertExpenseCategory(user1.UID, "Category 1")
		i.InsertExpenseCategory(user2.UID, "Category 2")
		i.InsertExpenseCategory(userDeleted.UID, "Category 3")
	}
	{
		i.InsertExpenseLocation(user1.UID, "Location 1")
		i.InsertExpenseLocation(user2.UID, "Location 2")
		i.InsertExpenseLocation(userDeleted.UID, "Location 3")
		i.InsertExpenseLocation(user2.UID, "Location 4")
	}

	q := userQueue{
		&auth.ExportedUserRecord{UserRecord: &auth.UserRecord{UserInfo: &auth.UserInfo{UID: user1.UID}}},
		&auth.ExportedUserRecord{UserRecord: &auth.UserRecord{UserInfo: &auth.UserInfo{UID: user2.UID}}},
	}
	authIteratorMock := client.AuthUserIteratorMock{
		NextFunc: func() (*auth.ExportedUserRecord, error) {
			res := q.deq()
			if res == nil {
				return nil, iterator.Done
			}
			return res, nil
		},
	}
	authClientMock := &client.AuthClientMock{
		UsersFunc: func(ctx context.Context, nextPageToken string) client.AuthUserIterator {
			return &authIteratorMock
		},
	}

	newDeleteUserJob(authClientMock, repositories.NewSuitoRepository(tx)).do()

	// check
	var cnt int64

	{
		require.Error(t, tx.Unscoped().Where("uid = ?", userDeleted.UID).First(&model.Expense{}).Error)
		tx.Model(&model.Expense{}).Count(&cnt)
		require.EqualValues(t, 2, cnt)
	}
	{
		require.Error(t, tx.Unscoped().Where("uid = ?", userDeleted.UID).First(&model.Income{}).Error)
		tx.Model(&model.Income{}).Count(&cnt)
		require.EqualValues(t, 2, cnt)
	}
	{
		require.Error(t, tx.Unscoped().Where("uid = ?", userDeleted.UID).First(&model.ExpenseCategory{}).Error)
		tx.Model(&model.ExpenseCategory{}).Count(&cnt)
		require.EqualValues(t, 2, cnt)
	}
	{
		require.Error(t, tx.Unscoped().Where("uid = ?", userDeleted.UID).First(&model.ExpenseLocation{}).Error)
		tx.Model(&model.ExpenseLocation{}).Count(&cnt)
		require.EqualValues(t, 3, cnt)
	}

	var deletedUser model.User
	require.NoError(t, tx.Unscoped().Where("uid = ?", userDeleted.UID).First(&deletedUser).Error)
	require.NotNil(t, deletedUser.DeletedAt)
}
