package services

import (
	"context"
	"os"
	"testing"

	"firebase.google.com/go/v4/auth"
	"github.com/joho/godotenv"
	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/api/repositories"
	"github.com/wakamenod/suito/client"
	"github.com/wakamenod/suito/db"
	"github.com/wakamenod/suito/db/transaction"
	"github.com/wakamenod/suito/log"
	"github.com/wakamenod/suito/model"
	"github.com/wakamenod/suito/utils/testutils"
	"google.golang.org/api/iterator"
	"gorm.io/gorm"
)

type userQueue []*auth.ExportedUserRecord

func (q *userQueue) deq() *auth.ExportedUserRecord {
	if len(*q) == 0 {
		return nil
	}

	res := (*q)[0]
	*q = (*q)[1:]
	return res
}

func TestGetFirebaseUsers(t *testing.T) {
	testutils.SkipIfShort(t)

	require.NoError(t, log.InitWithConfigPath("../../config/config.test.toml"))
	require.NoError(t, godotenv.Load("../../../.env.suito"))
	require.NoError(t, os.Setenv("GOOGLE_APPLICATION_CREDENTIALS", "../../firebase-adminsdk.json"))

	authClient := client.NewFirebaseAuthClient()
	res, err := fetchFirebaseUsers(authClient)
	require.NoError(t, err)
	require.True(t, res[os.Getenv("FIREBASE_UID")])
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
	res, err := fetchFirebaseUsers(authClientMock)
	require.NoError(t, err)
	require.Equal(t, 3, len(res))
}

func openDB() *gorm.DB {
	err := log.InitWithConfigPath("../../config/config.test.toml")
	if err != nil {
		log.Fatal("failed to init config", nil)
	}
	if err := godotenv.Load("../../../.env.suito"); err != nil {
		log.Fatal("failed to load env file", nil)
	}
	return db.OpenTestDB()
}

func begin() *gorm.DB {
	db := openDB()
	tx := db.Begin()
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

	require.NoError(t, NewSuitoJobService(
		repositories.NewSuitoRepository(tx),
		transaction.NewSuitoTransactionProvider(tx),
		authClientMock,
	).DeleteUsersJobService())

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
