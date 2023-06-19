package testutils

import (
	"testing"
	"time"

	"github.com/rs/xid"
	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
	"gorm.io/gorm"
)

type (
	TestDataInserter struct {
		t  *testing.T
		db *gorm.DB
	}
)

const dateLayout = "2006-01-02"

func NewTestDataInserter(t *testing.T, db *gorm.DB) *TestDataInserter {
	return &TestDataInserter{
		t:  t,
		db: db,
	}
}

func (e *TestDataInserter) InsertExpense(uid, date, title string, optionals ...string) string {
	parsedDate, err := time.Parse(dateLayout, date)
	require.NoError(e.t, err, "failed to parse date")

	categoryID := ""
	if len(optionals) > 0 {
		categoryID = optionals[0]
	}

	locationID := ""
	if len(optionals) > 1 {
		locationID = optionals[1]
	}

	id := xid.New().String()
	require.NoError(e.t, e.db.Create(&model.Expense{
		ID:                id,
		UID:               uid,
		Title:             title,
		Amount:            200,
		ExpenseCategoryID: categoryID,
		ExpenseLocationID: locationID,
		Memo:              "test memo",
		LocalDate:         parsedDate,
	}).Error, "failed to insert expense")
	return id
}

func (e *TestDataInserter) InsertExpenseDeleted(uid, date, title string) string {
	parsedDate, err := time.Parse(dateLayout, date)
	require.NoError(e.t, err, "failed to parse date")

	id := xid.New().String()
	require.NoError(e.t, e.db.Create(&model.Expense{
		ID:        id,
		UID:       uid,
		Title:     title,
		Amount:    200,
		Memo:      "test memo",
		LocalDate: parsedDate,
		DeletedAt: gorm.DeletedAt{Time: time.Now(), Valid: true},
	}).Error, "failed to insert expense")
	return id
}

func (i *TestDataInserter) InsertExpenseCategory(uid, name string) model.ExpenseCategory {
	cat := model.ExpenseCategory{
		ID:        xid.New().String(),
		Name:      name,
		UID:       uid,
		CreatedAt: time.Date(2023, 1, 1, 0, 0, 0, 0, time.UTC),
		UpdatedAt: time.Date(2023, 1, 1, 0, 0, 0, 0, time.UTC),
	}
	require.NoError(i.t, i.db.Create(&cat).Error, "failed to insert expense category")
	return cat
}

func (i *TestDataInserter) InsertExpenseLocation(uid, name string) model.ExpenseLocation {
	cat := model.ExpenseLocation{
		ID:        xid.New().String(),
		Name:      name,
		UID:       uid,
		CreatedAt: time.Date(2023, 1, 1, 0, 0, 0, 0, time.UTC),
		UpdatedAt: time.Date(2023, 1, 1, 0, 0, 0, 0, time.UTC),
	}
	require.NoError(i.t, i.db.Create(&cat).Error, "failed to insert expense location")
	return cat
}

func (e *TestDataInserter) InsertIncomeType(uid, name string) model.IncomeType {
	it := model.IncomeType{
		ID:   xid.New().String(),
		UID:  uid,
		Name: name,
	}
	require.NoError(e.t, e.db.Create(&it).Error, "failed to insert income type")
	return it
}

func (e *TestDataInserter) InsertIncome(uid, date string, optionals ...string) string {
	parsedDate, err := time.Parse(dateLayout, date)
	require.NoError(e.t, err, "failed to parse date")

	typeID := ""
	if len(optionals) > 0 {
		typeID = optionals[0]
	}

	id := xid.New().String()
	require.NoError(e.t, e.db.Create(&model.Income{
		ID:           id,
		UID:          uid,
		IncomeTypeID: typeID,
		Amount:       200,
		Memo:         "test memo",
		LocalDate:    parsedDate,
	}).Error, "failed to insert income")
	return id
}

func (e *TestDataInserter) InsertUser(uid string, deletedAt gorm.DeletedAt) model.User {
	user := model.User{
		ID:        xid.New().String(),
		UID:       uid,
		DeletedAt: deletedAt,
	}
	require.NoError(e.t, e.db.Create(&user).Error, "failed to insert user")
	return user
}

// SkipIfShort skips t if the "-short" flag is passed to "go test".
func SkipIfShort(t *testing.T) {
	if testing.Short() {
		t.SkipNow()
	}
}
