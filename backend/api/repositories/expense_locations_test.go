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

func TestFindExpenseLocations(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	uid := "user01"
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertExpenseLocation(uid, "Location_01")
	i.InsertExpenseLocation("user99", "Location_01 Other User")
	i.InsertExpenseLocation(uid, "Location_02")
	// run
	res, err := NewSuitoExpenseLocationRepository(tx).FindExpenseLocations(uid)
	// check
	require.NoError(t, err)
	require.Equal(t, 2, len(res))
	require.Equal(t, "Location_02", res[0].Name)
	require.Equal(t, "Location_01", res[1].Name)
}

func TestFindOrCreateExpenseLocation_New(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	// other user's data
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertExpenseLocation("user99", "NEW_LOCATION")

	uid := "user01"
	// run
	res, err := NewSuitoExpenseLocationRepository(tx).FindOrCreateExpenseLocation(uid, "NEW_LOCATION")
	// check
	require.NoError(t, err)
	require.Equal(t, "NEW_LOCATION", res.Name)
	require.Equal(t, uid, res.UID)
	require.NotEmpty(t, res.ID)

	var cnt int64
	tx.Model(&model.ExpenseLocation{}).Count(&cnt)
	require.EqualValues(t, 2, cnt)
}

func TestFindOrCreateExpenseLocation_Created(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	// other user's data
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertExpenseLocation("user99", "Location_02")

	location := i.InsertExpenseLocation("user01", "Location_02")
	// run
	res, err := NewSuitoExpenseLocationRepository(tx).FindOrCreateExpenseLocation(location.UID, location.Name)
	// check
	require.NoError(t, err)
	require.Equal(t, location.Name, res.Name)
	require.Equal(t, location.UID, res.UID)
	require.Equal(t, location.ID, res.ID)

	var cnt int64
	tx.Model(&model.ExpenseLocation{}).Count(&cnt)
	require.EqualValues(t, 2, cnt)
}

func TestFindOrCreateExpenseLocation_DuplicatedError(t *testing.T) {
	db, mock, err := setupMockDB(t)
	if err != nil {
		t.Fatalf("an error '%s' was not expected when opening a stub database connection", err)
	}

	userID := "user1"
	locationName := "Location Name"

	createdAt, _ := time.Parse("2006-01-02 15:04:05", "2023-05-01 00:00:00")
	updatedAt, _ := time.Parse("2006-01-02 15:04:05", "2023-05-01 00:00:00")

	mock.ExpectBegin()
	mock.ExpectQuery("^SELECT (.+) FROM `expense_location` WHERE (.+) ORDER BY `expense_location`.`id` LIMIT 1$").
		WithArgs(userID, locationName).
		WillReturnRows(sqlmock.NewRows([]string{"id", "uid", "name", "created_at", "updated_at"}))
	mock.ExpectExec("INSERT INTO `expense_location`").
		WithArgs(sqlmock.AnyArg(), userID, locationName, sqlmock.AnyArg(), sqlmock.AnyArg()).
		WillReturnError(gorm.ErrDuplicatedKey)
	mock.ExpectQuery("^SELECT (.+) FROM `expense_location` WHERE (.+) ORDER BY `expense_location`.`id` LIMIT 1$").
		WithArgs(userID, locationName).
		WillReturnRows(sqlmock.NewRows([]string{"id", "uid", "name", "created_at", "updated_at"}).
			AddRow("id1",
				userID,
				locationName,
				createdAt,
				updatedAt))

	// run
	_, err = NewSuitoExpenseLocationRepository(db).FindOrCreateExpenseLocation(userID, locationName)
	require.NoError(t, err)
	if err := mock.ExpectationsWereMet(); err != nil {
		t.Errorf("there were unfulfilled expectations: %s", err)
	}
}

func TestFindOrCreateExpenseLocation_OtherError(t *testing.T) {
	db, mock, err := setupMockDB(t)
	if err != nil {
		t.Fatalf("an error '%s' was not expected when opening a stub database connection", err)
	}

	userID := "user1"
	locationName := "Location Name"

	mock.ExpectBegin()
	mock.ExpectQuery("^SELECT (.+) FROM `expense_location` WHERE (.+) ORDER BY `expense_location`.`id` LIMIT 1$").
		WithArgs(userID, locationName).
		WillReturnRows(sqlmock.NewRows([]string{"id", "uid", "name", "created_at", "updated_at"}))
	mock.ExpectExec("INSERT INTO `expense_location`").
		WithArgs(sqlmock.AnyArg(), userID, locationName, sqlmock.AnyArg(), sqlmock.AnyArg()).
		WillReturnError(errors.New("some unknown error"))

	// run
	_, err = NewSuitoExpenseLocationRepository(db).FindOrCreateExpenseLocation(userID, locationName)
	require.Error(t, err)
	if err := mock.ExpectationsWereMet(); err != nil {
		t.Errorf("there were unfulfilled expectations: %s", err)
	}
}

func TestFindExpenseLocation(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	i := testutils.NewTestDataInserter(t, tx)
	location := i.InsertExpenseLocation("user01", "Location_02")
	// run
	res, err := NewSuitoExpenseLocationRepository(tx).FindExpenseLocation(location.ID, location.UID)
	// check
	require.NoError(t, err)
	require.Equal(t, location.Name, res.Name)
	require.Equal(t, location.UID, res.UID)
	require.Equal(t, location.ID, res.ID)
}

func TestFindExpenseLocation_NotFound(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	i := testutils.NewTestDataInserter(t, tx)
	location := i.InsertExpenseLocation("user01", "Location_02")
	// run
	_, err := NewSuitoExpenseLocationRepository(tx).FindExpenseLocation(location.ID, "user99")
	// check
	require.Error(t, err)
	require.ErrorIs(t, err, gorm.ErrRecordNotFound)
}

func TestHardDeleteAllUserExpenseLocations(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	userID := "user1"
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertExpenseLocation(userID, "Location_01")
	i.InsertExpenseLocation(userID, "Location_02")
	i.InsertExpenseLocation("user99", "Location_03")
	// run
	err := NewSuitoExpenseLocationRepository(tx).HardDeleteAllUserExpenseLocations(userID)
	// check
	require.NoError(t, err)

	var found model.ExpenseLocation
	err = tx.Where("uid = ?", userID).Unscoped().First(&found).Error
	require.Error(t, err)
	require.ErrorIs(t, err, gorm.ErrRecordNotFound)

	var cnt int64
	tx.Model(&model.ExpenseLocation{}).Count(&cnt)
	require.EqualValues(t, 1, cnt)
}

func TestCreateExpenseLocation(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	location := model.ExpenseLocation{Name: "location name"}
	// run
	res, err := NewSuitoExpenseLocationRepository(tx).CreateExpenseLocation("user1", location)
	// check
	require.NoError(t, err)
	require.NotEmpty(t, res.ID)
	require.Equal(t, "user1", res.UID)
	require.Equal(t, location.Name, res.Name)
}

func TestUpdateExpenseLocation(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	i := testutils.NewTestDataInserter(t, tx)
	id := i.InsertExpenseLocation("user1", "Location01").ID
	i.InsertExpenseLocation("user99", "Other users location")
	i.InsertExpenseLocation("user1", "Location02")
	targetExpenseLocation := model.ExpenseLocation{
		ID:   id,
		Name: "update name",
	}
	// run
	_, err := NewSuitoExpenseLocationRepository(tx).UpdateExpenseLocation("user1", targetExpenseLocation)
	// check
	require.NoError(t, err)

	found, err := NewSuitoExpenseLocationRepository(tx).FindExpenseLocation(id, "user1")
	require.NoError(t, err)
	require.Equal(t, targetExpenseLocation.Name, found.Name)
}

func TestDeleteExpenseLocation(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	uid := "user1"
	i := testutils.NewTestDataInserter(t, tx)
	id := i.InsertExpenseLocation(uid, "Location01").ID
	otherID := i.InsertExpenseLocation(uid, "Other users location").ID
	i.InsertExpenseLocation(uid, "Location02")
	ex1ID := i.InsertExpense(uid, "2023-04-05", "title", "", id)
	ex2ID := i.InsertExpense(uid, "2023-04-05", "title", "", otherID)
	// run
	err := NewSuitoExpenseLocationRepository(tx).DeleteExpenseLocation(id, "user1")
	// check
	require.NoError(t, err)

	var found model.ExpenseLocation
	require.Error(t, tx.Where("id = ? AND uid = ?", id, uid).Unscoped().First(&found).Error)
	{
		var ex1 model.Expense
		require.NoError(t, tx.Where("id = ?", ex1ID).Unscoped().First(&ex1).Error)
		require.Empty(t, ex1.ExpenseLocationID)
	}
	{
		var ex2 model.Expense
		require.NoError(t, tx.Where("id = ?", ex2ID).Unscoped().First(&ex2).Error)
		require.NotEmpty(t, ex2.ExpenseLocationID)
	}
}
