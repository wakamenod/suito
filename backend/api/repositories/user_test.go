package repositories

import (
	"errors"
	"testing"
	"time"

	"github.com/DATA-DOG/go-sqlmock"
	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
	"github.com/wakamenod/suito/utils/testutils"
	"gorm.io/gorm"
)

func TestFindAllUIDs(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertUser("user1", gorm.DeletedAt{})
	i.InsertUser("user2", gorm.DeletedAt{})
	i.InsertUser("deleted_user", gorm.DeletedAt{Valid: true, Time: time.Date(2023, 5, 1, 0, 0, 0, 0, time.UTC)})
	// run
	res, err := NewSuitoRepository(tx).FindAllUIDs()
	// check
	require.NoError(t, err)
	require.Equal(t, 2, len(res))
	require.Contains(t, res, "user1")
	require.Contains(t, res, "user2")
}

func TestDeleteUsers(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertUser("user1", gorm.DeletedAt{})
	i.InsertUser("user2", gorm.DeletedAt{})
	// run
	err := NewSuitoRepository(tx).DeleteUsers([]string{"user1", "user2"})
	// check
	require.NoError(t, err)

	var founds []model.User
	require.NoError(t, tx.Unscoped().Find(&founds).Order("uid").Error)
	require.Equal(t, "user1", founds[0].UID)
	require.NotNil(t, founds[0].DeletedAt)
	require.Equal(t, "user2", founds[1].UID)
	require.NotNil(t, founds[1].DeletedAt)
}

func TestFindOrCreateUser_New(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	// other user's data
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertUser("user99", gorm.DeletedAt{})

	uid := "user01"
	// run
	res, err := NewSuitoRepository(tx).FindOrCreateUser(uid)
	// check
	require.NoError(t, err)
	require.Equal(t, uid, res.UID)
	require.NotEmpty(t, res.ID)

	var cnt int64
	tx.Model(&model.User{}).Count(&cnt)
	require.EqualValues(t, 2, cnt)
}

func TestFindOrCreateUser_Created(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	// other user's data
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertUser("user99", gorm.DeletedAt{})

	user := i.InsertUser("user01", gorm.DeletedAt{})
	// run
	res, err := NewSuitoRepository(tx).FindOrCreateUser(user.UID)
	// check
	require.NoError(t, err)
	require.Equal(t, user.UID, res.UID)
	require.Equal(t, user.ID, res.ID)

	var cnt int64
	tx.Model(&model.User{}).Count(&cnt)
	require.EqualValues(t, 2, cnt)
}

func TestFindOrCreateUser_Deleted(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	i := testutils.NewTestDataInserter(t, tx)
	user := i.InsertUser("user01", gorm.DeletedAt{Valid: true, Time: time.Date(2023, 5, 1, 0, 0, 0, 0, time.UTC)})
	// run
	res, err := NewSuitoRepository(tx).FindOrCreateUser(user.UID)
	// check
	require.NoError(t, err)
	require.Equal(t, user.UID, res.UID)
	require.NotEqual(t, user.ID, res.ID)

	var cnt int64
	tx.Model(&model.User{}).Count(&cnt)
	require.EqualValues(t, 1, cnt)
}

func TestFindOrCreateUser_DuplicatedError(t *testing.T) {
	db, mock, err := setupMockDB(t)
	if err != nil {
		t.Fatalf("an error '%s' was not expected when opening a stub database connection", err)
	}

	userID := "user1"
	createdAt, _ := time.Parse("2006-01-02 15:04:05", "2023-05-01 00:00:00")
	updatedAt, _ := time.Parse("2006-01-02 15:04:05", "2023-05-01 00:00:00")
	deletedAt, _ := time.Parse("2006-01-02 15:04:05", "2023-05-01 00:00:00")

	mock.ExpectBegin()
	mock.ExpectQuery("^SELECT (.+) FROM `user` WHERE (.+) ORDER BY `user`.`id` LIMIT 1$").
		WithArgs(userID).
		WillReturnRows(sqlmock.NewRows([]string{"id", "uid", "deleted_at", "created_at", "updated_at"}))
	mock.ExpectExec("INSERT INTO `user`").
		WithArgs(sqlmock.AnyArg(), userID, sqlmock.AnyArg(), sqlmock.AnyArg(), sqlmock.AnyArg()).
		WillReturnError(gorm.ErrDuplicatedKey)
	mock.ExpectQuery("^SELECT (.+) FROM `user` WHERE (.+) ORDER BY `user`.`id` LIMIT 1$").
		WithArgs(userID).
		WillReturnRows(sqlmock.NewRows([]string{"id", "uid", "deleted_at", "created_at", "updated_at"}).
			AddRow("id1",
				userID,
				deletedAt,
				createdAt,
				updatedAt))

	// run
	_, err = NewSuitoRepository(db).FindOrCreateUser(userID)
	require.NoError(t, err)
	if err := mock.ExpectationsWereMet(); err != nil {
		t.Errorf("there were unfulfilled expectations: %s", err)
	}
}

func TestFindOrCreateUser_OtherError(t *testing.T) {
	db, mock, err := setupMockDB(t)
	if err != nil {
		t.Fatalf("an error '%s' was not expected when opening a stub database connection", err)
	}

	userID := "user1"

	mock.ExpectBegin()
	mock.ExpectQuery("^SELECT (.+) FROM `user` WHERE (.+) ORDER BY `user`.`id` LIMIT 1$").
		WithArgs(userID).
		WillReturnRows(sqlmock.NewRows([]string{"id", "uid", "deleted_at", "created_at", "updated_at"}))
	mock.ExpectExec("INSERT INTO `user`").
		WithArgs(sqlmock.AnyArg(), userID, sqlmock.AnyArg(), sqlmock.AnyArg(), sqlmock.AnyArg()).
		WillReturnError(errors.New("some unknown error"))

	// run
	_, err = NewSuitoRepository(db).FindOrCreateUser(userID)
	require.Error(t, err)
	if err := mock.ExpectationsWereMet(); err != nil {
		t.Errorf("there were unfulfilled expectations: %s", err)
	}
}
