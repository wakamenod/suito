package repositories

import (
	"errors"
	"testing"
	"time"

	"github.com/DATA-DOG/go-sqlmock"
	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/apperrors"
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
	res, err := NewSuitoIncomeTypeRepository(tx).FindIncomeTypes(uid)
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
	res, err := NewSuitoIncomeTypeRepository(tx).FindOrCreateIncomeType(uid, "INCOME_TYPE")
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
	res, err := NewSuitoIncomeTypeRepository(tx).FindOrCreateIncomeType(incomeType.UID, incomeType.Name)
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
	_, err = NewSuitoIncomeTypeRepository(db).FindOrCreateIncomeType(userID, incomeTypeName)
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
	_, err = NewSuitoIncomeTypeRepository(db).FindOrCreateIncomeType(userID, incomeTypeName)
	require.Error(t, err)
	if err := mock.ExpectationsWereMet(); err != nil {
		t.Errorf("there were unfulfilled expectations: %s", err)
	}
}

func TestCreateIncomeType(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	incomeType := model.IncomeType{Name: "incomeType name"}
	// run
	res, err := NewSuitoIncomeTypeRepository(tx).CreateIncomeType("user1", incomeType)
	// check
	require.NoError(t, err)
	require.NotEmpty(t, res.ID)
	require.Equal(t, "user1", res.UID)
	require.Equal(t, incomeType.Name, res.Name)
}

func TestUpdateIncomeType(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	i := testutils.NewTestDataInserter(t, tx)
	id := i.InsertIncomeType("user1", "Location01").ID
	i.InsertIncomeType("user99", "Other users location")
	i.InsertIncomeType("user1", "Location02")
	targetIncomeType := model.IncomeType{
		ID:   id,
		Name: "update name",
	}
	// run
	_, err := NewSuitoIncomeTypeRepository(tx).UpdateIncomeType("user1", targetIncomeType)
	// check
	require.NoError(t, err)

	var found model.IncomeType
	require.NoError(t, tx.Where(model.IncomeType{ID: id, UID: "user1"}).
		First(&found).Error)
	require.Equal(t, targetIncomeType.Name, found.Name)
}

func TestDeleteIncomeType(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	i := testutils.NewTestDataInserter(t, tx)
	id := i.InsertIncomeType("user1", "IncomeType01").ID
	i.InsertIncomeType("user99", "Other users incomeType")
	i.InsertIncomeType("user1", "IncomeType02")
	// run
	err := NewSuitoIncomeTypeRepository(tx).DeleteIncomeType(id, "user1")
	// check
	require.NoError(t, err)

	var found model.IncomeType
	require.Error(t, tx.Where("id = ? AND uid = ?", id, "user1").Unscoped().First(&found).Error)
}

func TestDeleteIncomeType_ErrorInUse(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	uid := "user1"
	i := testutils.NewTestDataInserter(t, tx)
	id := i.InsertIncomeType(uid, "IncomeType01").ID
	i.InsertIncomeType("user99", "Other users incomeType")
	i.InsertIncomeType(uid, "IncomeType02")
	i.InsertIncome(uid, "2023-05-01", id)
	// run
	err := NewSuitoIncomeTypeRepository(tx).DeleteIncomeType(id, uid)
	// check
	require.Error(t, err)
	var suitoError *apperrors.SuitoError
	require.ErrorAs(t, err, &suitoError)
	require.Equal(t, apperrors.IncomeTypeInUse, suitoError.ErrCode)
}
