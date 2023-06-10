package services

import (
	"testing"
	"time"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
	"gorm.io/gorm"
)

func TestFindExpenseService(t *testing.T) {
	res, err := aSer.FindExpenseService("ID_EXPENSE_02", "user1")
	require.NoError(t, err)
	require.Equal(t, 200, res.Amount)
	require.Equal(t, "Test002", res.Title)
}

func TestFindExpenseService_Error(t *testing.T) {
	_, err := aSer.FindExpenseService("ID_EXPENSE_02", "user2")
	require.Error(t, err)
	require.ErrorIs(t, err, gorm.ErrRecordNotFound)
}

func TestCreateExpenseService_NoCategoryLocatoin(t *testing.T) {
	expense := model.Expense{
		Title:     "test_title",
		LocalDate: time.Date(2023, 5, 3, 0, 0, 0, 0, time.UTC),
		Amount:    2000,
		Memo:      "test_memo",
	}
	newExpense, err := aSer.CreateExpenseService("user1", expense, "", "")
	require.NoError(t, err)
	require.Equal(t, "new_expense_id", newExpense.ID)
	require.Empty(t, newExpense.ExpenseCategoryID)
	require.Empty(t, newExpense.ExpenseLocationID)
}

func TestCreateExpenseService(t *testing.T) {
	expense := model.Expense{
		Title:     "test_title",
		LocalDate: time.Date(2023, 5, 3, 0, 0, 0, 0, time.UTC),
		Amount:    2000,
		Memo:      "test_memo",
	}
	newExpense, err := aSer.CreateExpenseService("user1", expense, "Test Category", "Test Location")
	require.NoError(t, err)
	require.Equal(t, "new_expense_id", newExpense.ID)
	require.Equal(t, "TEST_CATEGORY_ID", newExpense.ExpenseCategoryID)
	require.Equal(t, "TEST_LOCATION_ID", newExpense.ExpenseLocationID)
}
