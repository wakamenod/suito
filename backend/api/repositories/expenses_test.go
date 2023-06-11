package repositories

import (
	"testing"
	"time"

	"github.com/DATA-DOG/go-sqlmock"
	"github.com/rs/xid"
	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/log"
	"github.com/wakamenod/suito/model"
	"github.com/wakamenod/suito/utils/dateutils"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

const dateLayout = "2006-01-02"

type (
	expenseInserter struct {
		t  *testing.T
		db *gorm.DB
	}
)

func newExpenseInserter(t *testing.T, db *gorm.DB) *expenseInserter {
	return &expenseInserter{
		t:  t,
		db: db,
	}
}

func (e *expenseInserter) mustInsert(uid, date, title string) string {
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
	}).Error, "failed to insert expense")
	return id
}

func (e *expenseInserter) mustInsertDeleted(uid, date, title string) string {
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

func SetupMockDB(t *testing.T) (*gorm.DB, sqlmock.Sqlmock, error) {
	mockDB, mock, err := sqlmock.New()
	if err != nil {
		return nil, nil, err
	}

	gormDB, err := gorm.Open(mysql.New(
		mysql.Config{
			Conn:                      mockDB,
			SkipInitializeWithVersion: true,
		}),
		&gorm.Config{},
	)
	require.NoError(t, err)

	return gormDB, mock, nil
}

func TestFindExpensesUsingMock(t *testing.T) {
	db, mock, err := SetupMockDB(t)
	if err != nil {
		t.Fatalf("an error '%s' was not expected when opening a stub database connection", err)
	}

	localDate, _ := time.Parse("2006-01-02", "2023-05-01")
	createdAt, _ := time.Parse("2006-01-02 15:04:05", "2023-05-01 00:00:00")
	updatedAt, _ := time.Parse("2006-01-02 15:04:05", "2023-05-01 00:00:00")
	rows := sqlmock.NewRows([]string{"id", "uid", "local_date", "amount", "memo", "title", "expense_location_id", "expense_category_id", "created_at", "updated_at"}).
		AddRow("1", "user1", localDate, 1000, "memo", "title", "loc1", "cat1", createdAt, updatedAt).
		AddRow("2", "user2", localDate, 2000, "memo", "title", "loc1", "cat1", createdAt, updatedAt)

	start, end, err := dateutils.YearMonthDateRange("2023-05")
	require.NoError(t, err)
	mock.ExpectQuery("^SELECT (.+) FROM `expense` WHERE (.+) ORDER BY local_date desc$").
		WithArgs("user1", start, end).
		WillReturnRows(rows)

	start, end, err = dateutils.YearMonthDateRange("2023-05")
	require.NoError(t, err)
	expenses, err := NewSuitoRepository(db).FindExpenses("user1", start, end)
	require.NoError(t, err)
	require.NotNil(t, expenses)
	require.Len(t, expenses, 2)

	require.Equal(t, "1", expenses[0].ID)
	require.Equal(t, "2", expenses[1].ID)

	// we make sure that all expectations were met
	if err := mock.ExpectationsWereMet(); err != nil {
		t.Errorf("there were unfulfilled expectations: %s", err)
	}
}

func begin() *gorm.DB {
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

// An empty result set should not cause an error
func TestFindExpenses(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	// run
	start, end, err := dateutils.YearMonthDateRange("2023-05")
	require.NoError(t, err)
	res, err := NewSuitoRepository(tx).FindExpenses("", start, end)
	// check
	require.NoError(t, err)
	require.Empty(t, res)
}

// Other user's date should never be retrieved
func TestFindExpenses2(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := newExpenseInserter(t, tx)
	i.mustInsert("user1", "2023-05-01", "title01")
	i.mustInsert("user2", "2023-05-02", "title02")
	i.mustInsert("user1", "2023-05-03", "title03")
	i.mustInsertDeleted("user1", "2023-05-03", "title deleted")
	// run
	start, end, err := dateutils.YearMonthDateRange("2023-05")
	require.NoError(t, err)
	res, err := NewSuitoRepository(tx).FindExpenses("user1", start, end)
	// check
	require.NoError(t, err)
	require.Equal(t, 2, len(res))
	require.Equal(t, "title03", res[0].Title)
	require.Equal(t, "title01", res[1].Title)
}

// Check date range
func TestFindExpenses3(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := newExpenseInserter(t, tx)
	i.mustInsert("user1", "2023-05-01", "title01")
	i.mustInsert("user1", "2023-05-02", "title02")
	i.mustInsert("user1", "2023-06-03", "title03")
	// run
	start, end, err := dateutils.YearMonthDateRange("2023-05")
	require.NoError(t, err)
	res, err := NewSuitoRepository(tx).FindExpenses("user1", start, end)
	// check
	require.NoError(t, err)
	require.Equal(t, 2, len(res))
	require.Equal(t, "title02", res[0].Title)
	require.Equal(t, "title01", res[1].Title)
}

func TestFindExpense(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := newExpenseInserter(t, tx)
	id := i.mustInsert("user2", "2023-05-02", "title02")
	// run
	res, err := NewSuitoRepository(tx).FindExpense(id, "user2")
	// check
	require.NoError(t, err)
	require.Equal(t, id, res.ID)
}

func TestFindExpense_ErrorNotFound(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := newExpenseInserter(t, tx)
	id := i.mustInsert("user2", "2023-05-02", "title02")
	// run
	_, err := NewSuitoRepository(tx).FindExpense(id, "user1")
	// check
	require.Error(t, err)
	require.ErrorIs(t, err, gorm.ErrRecordNotFound)
}

func TestCreateExpense(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	expense := model.Expense{Title: "title", Amount: 2000, LocalDate: time.Date(2023, 5, 1, 0, 0, 0, 0, time.UTC)}
	// run
	res, err := NewSuitoRepository(tx).CreateExpense("user1", expense)
	// check
	require.NoError(t, err)
	require.NotEmpty(t, res.ID)
	require.Equal(t, "user1", res.UID)
	require.Equal(t, expense.Title, res.Title)
	require.Equal(t, expense.Amount, res.Amount)
}

func TestUpdateExpense(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	i := newExpenseInserter(t, tx)
	id := i.mustInsert("user1", "2023-05-01", "title01")
	i.mustInsert("user99", "2023-05-01", "title99")
	i.mustInsert("user1", "2023-05-01", "title01_2")
	targetExpense := model.Expense{
		ID:     id,
		Title:  "update title",
		Amount: 2000, LocalDate: time.Date(2022, 6, 1, 0, 0, 0, 0, time.UTC),
		ExpenseLocationID: "location_id",
		ExpenseCategoryID: "category_id",
	}
	// run
	_, err := NewSuitoRepository(tx).UpdateExpense("user1", targetExpense)
	// check
	require.NoError(t, err)

	found, err := NewSuitoRepository(tx).FindExpense(id, "user1")
	require.NoError(t, err)
	require.Equal(t, targetExpense.Title, found.Title)
	require.Equal(t, targetExpense.Amount, found.Amount)
	layout := "2006-01-02"
	require.Equal(t, targetExpense.LocalDate.Format(layout), found.LocalDate.Format(layout))
	require.Equal(t, targetExpense.ExpenseCategoryID, found.ExpenseCategoryID)
	require.Equal(t, targetExpense.ExpenseLocationID, found.ExpenseLocationID)
}

func TestDeleteExpense(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	i := newExpenseInserter(t, tx)
	id := i.mustInsert("user1", "2023-05-01", "title01")
	i.mustInsert("user99", "2023-05-01", "title99")
	i.mustInsert("user1", "2023-05-01", "title01_2")
	// run
	err := NewSuitoRepository(tx).DeleteExpense(id, "user1")
	// check
	require.NoError(t, err)

	var found model.Expense
	require.NoError(t, tx.Where("id = ? AND uid = ?", id, "user1").Unscoped().First(&found).Error)
	require.NotNil(t, found.DeletedAt)
}
