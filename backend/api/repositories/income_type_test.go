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

func TestFindIncomeTypes(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	uid := "user01"
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertIncomeType(uid, "IncomeType_01")
	i.InsertIncomeType("user99", "IncomeType_01 Other User")
	i.InsertIncomeType(uid, "IncomeType_02")
	// run
	res, err := NewSuitoRepository(tx).FindIncomeTypes(uid)
	// check
	require.NoError(t, err)
	require.Equal(t, 2, len(res))
	require.Equal(t, "IncomeType_02", res[0].Name)
	require.Equal(t, "IncomeType_01", res[1].Name)
}

func TestFindOrCreateIncomeType_New(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	// other user's data
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertIncomeType("user99", "NEW_INCOME_TYPE")

	uid := "user01"
	// run
	res, err := NewSuitoRepository(tx).FindOrCreateIncomeType(uid, "INCOME_TYPE")
	// check
	require.NoError(t, err)
	require.Equal(t, "INCOME_TYPE", res.Name)
	require.Equal(t, uid, res.UID)
	require.NotEmpty(t, res.ID)

	var cnt int64
	tx.Model(&model.IncomeType{}).Count(&cnt)
	require.EqualValues(t, 2, cnt)
}

func TestFindOrCreateIncomeType_Created(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	// other user's data
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertIncomeType("user99", "Income_type_02")

	incomeType := i.InsertIncomeType("user01", "Income_type_02")
	// run
	res, err := NewSuitoRepository(tx).FindOrCreateIncomeType(incomeType.UID, incomeType.Name)
	// check
	require.NoError(t, err)
	require.Equal(t, incomeType.Name, res.Name)
	require.Equal(t, incomeType.UID, res.UID)
	require.Equal(t, incomeType.ID, res.ID)

	var cnt int64
	tx.Model(&model.IncomeType{}).Count(&cnt)
	require.EqualValues(t, 2, cnt)
}

func TestFindOrCreateIncomeType_DuplicatedError(t *testing.T) {
	db, mock, err := setupMockDB(t)
	if err != nil {
		t.Fatalf("an error '%s' was not expected when opening a stub database connection", err)
	}

	userID := "user1"
	incomeTypeName := "IncomeType Name"

	createdAt, _ := time.Parse("2006-01-02 15:04:05", "2023-05-01 00:00:00")
	updatedAt, _ := time.Parse("2006-01-02 15:04:05", "2023-05-01 00:00:00")

	mock.ExpectBegin()
	mock.ExpectQuery("^SELECT (.+) FROM `income_type` WHERE (.+) ORDER BY `income_type`.`id` LIMIT 1$").
		WithArgs(userID, incomeTypeName).
		WillReturnRows(sqlmock.NewRows([]string{"id", "uid", "name", "created_at", "updated_at"}))
	mock.ExpectExec("INSERT INTO `income_type`").
		WithArgs(sqlmock.AnyArg(), userID, incomeTypeName, sqlmock.AnyArg(), sqlmock.AnyArg()).
		WillReturnError(gorm.ErrDuplicatedKey)
	mock.ExpectQuery("^SELECT (.+) FROM `income_type` WHERE (.+) ORDER BY `income_type`.`id` LIMIT 1$").
		WithArgs(userID, incomeTypeName).
		WillReturnRows(sqlmock.NewRows([]string{"id", "uid", "name", "created_at", "updated_at"}).
			AddRow("id1",
				userID,
				incomeTypeName,
				createdAt,
				updatedAt))

	// run
	_, err = NewSuitoRepository(db).FindOrCreateIncomeType(userID, incomeTypeName)
	require.NoError(t, err)
	if err := mock.ExpectationsWereMet(); err != nil {
		t.Errorf("there were unfulfilled expectations: %s", err)
	}
}

func TestFindOrCreateIncomeType_OtherError(t *testing.T) {
	db, mock, err := setupMockDB(t)
	if err != nil {
		t.Fatalf("an error '%s' was not expected when opening a stub database connection", err)
	}

	userID := "user1"
	incomeTypeName := "IncomeType Name"

	mock.ExpectBegin()
	mock.ExpectQuery("^SELECT (.+) FROM `income_type` WHERE (.+) ORDER BY `income_type`.`id` LIMIT 1$").
		WithArgs(userID, incomeTypeName).
		WillReturnRows(sqlmock.NewRows([]string{"id", "uid", "name", "created_at", "updated_at"}))
	mock.ExpectExec("INSERT INTO `income_type`").
		WithArgs(sqlmock.AnyArg(), userID, incomeTypeName, sqlmock.AnyArg(), sqlmock.AnyArg()).
		WillReturnError(errors.New("some unknown error"))

	// run
	_, err = NewSuitoRepository(db).FindOrCreateIncomeType(userID, incomeTypeName)
	require.Error(t, err)
	if err := mock.ExpectationsWereMet(); err != nil {
		t.Errorf("there were unfulfilled expectations: %s", err)
	}
}
