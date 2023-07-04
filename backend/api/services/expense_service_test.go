package services

import (
	"testing"
	"time"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
	"gorm.io/gorm"
)

func TestFindExpenseService(t *testing.T) {
	res, err := expenseSer.FindExpenseService("ID_EXPENSE_02", "user1")
	require.NoError(t, err)
	require.Equal(t, 200, res.Amount)
	require.Equal(t, "Test002", res.Title)
}

func TestFindExpenseService_Error(t *testing.T) {
	_, err := expenseSer.FindExpenseService("ID_EXPENSE_02", "user2")
	require.Error(t, err)
	require.ErrorIs(t, err, gorm.ErrRecordNotFound)
}

func TestCreateExpenseService_NoCategoryLocation(t *testing.T) {
	expense := model.Expense{
		Title:     "test_title",
		LocalDate: time.Date(2023, 5, 3, 0, 0, 0, 0, time.UTC),
		Amount:    2000,
		Memo:      "test_memo",
	}
	newExpense, err := expenseSer.CreateExpenseService("user1", expense)
	require.NoError(t, err)
	require.Equal(t, "new_expense_id", newExpense.ID)
	require.Empty(t, newExpense.ExpenseCategoryID)
	require.Empty(t, newExpense.ExpenseLocationID)
}

func TestCreateExpenseService(t *testing.T) {
	expense := model.Expense{
		Title:             "test_title",
		LocalDate:         time.Date(2023, 5, 3, 0, 0, 0, 0, time.UTC),
		Amount:            2000,
		Memo:              "test_memo",
		ExpenseCategoryID: "TEST_CATEGORY_ID",
		ExpenseLocationID: "TEST_LOCATION_ID",
	}
	newExpense, err := expenseSer.CreateExpenseService("user1", expense)
	require.NoError(t, err)
	require.Equal(t, "new_expense_id", newExpense.ID)
	require.Equal(t, expense.ExpenseCategoryID, newExpense.ExpenseCategoryID)
	require.Equal(t, expense.ExpenseLocationID, newExpense.ExpenseLocationID)
}

func TestUpdateExpenseService_NoCategoryLocation(t *testing.T) {
	expense := model.Expense{
		ID:        "update_target_expense_id",
		Title:     "test_title",
		LocalDate: time.Date(2023, 5, 3, 0, 0, 0, 0, time.UTC),
		Amount:    2000,
		Memo:      "test_memo",
	}
	newExpense, err := expenseSer.UpdateExpenseService("user1", expense)
	require.NoError(t, err)
	require.Equal(t, expense.ID, newExpense.ID)
	require.Empty(t, newExpense.ExpenseCategoryID)
	require.Empty(t, newExpense.ExpenseLocationID)
}

func TestUpdateExpenseService(t *testing.T) {
	expense := model.Expense{
		ID:                "update_target_expense_id",
		Title:             "test_title",
		LocalDate:         time.Date(2023, 5, 3, 0, 0, 0, 0, time.UTC),
		Amount:            2000,
		Memo:              "test_memo",
		ExpenseCategoryID: "TEST_CATEGORY_ID",
		ExpenseLocationID: "TEST_LOCATION_ID",
	}
	newExpense, err := expenseSer.UpdateExpenseService("user1", expense)
	require.NoError(t, err)
	require.Equal(t, expense.ID, newExpense.ID)
	require.Equal(t, expense.ExpenseCategoryID, newExpense.ExpenseCategoryID)
	require.Equal(t, expense.ExpenseLocationID, newExpense.ExpenseLocationID)
}

func TestUpdateExpenseService_Deselect(t *testing.T) {
	expense := model.Expense{
		ID:        "update_target_expense_id",
		Title:     "test_title",
		LocalDate: time.Date(2023, 5, 3, 0, 0, 0, 0, time.UTC),
		Amount:    2000,
		Memo:      "test_memo",
	}
	newExpense, err := expenseSer.UpdateExpenseService("user1", expense)
	require.NoError(t, err)
	require.Equal(t, expense.ID, newExpense.ID)
	require.Empty(t, newExpense.ExpenseCategoryID)
	require.Empty(t, newExpense.ExpenseLocationID)
}
