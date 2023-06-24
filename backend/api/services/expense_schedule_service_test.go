package services

import (
	"testing"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
)

func TestUpdateExpenseScheduleService_NoCategoryLocation(t *testing.T) {
	expenseSchedule := model.ExpenseSchedule{
		ID:     "update_target_expenseSchedule_id",
		Title:  "test_title",
		Amount: 2000,
		Memo:   "test_memo",
	}
	newExpenseSchedule, err := aSer.UpdateExpenseScheduleService("user1", expenseSchedule)
	require.NoError(t, err)
	require.Equal(t, expenseSchedule.ID, newExpenseSchedule.ID)
	require.Empty(t, newExpenseSchedule.ExpenseCategoryID)
	require.Empty(t, newExpenseSchedule.ExpenseLocationID)
}

func TestUpdateExpenseScheduleService(t *testing.T) {
	expenseSchedule := model.ExpenseSchedule{
		ID:     "update_target_expenseSchedule_id",
		Title:  "test_title",
		Amount: 2000,
		Memo:   "test_memo",
		ExpenseCategory: model.ExpenseCategory{
			Name: "new category",
		},
		ExpenseLocation: model.ExpenseLocation{
			Name: "new location",
		},
	}
	newExpenseSchedule, err := aSer.UpdateExpenseScheduleService("user1", expenseSchedule)
	require.NoError(t, err)
	require.Equal(t, expenseSchedule.ID, newExpenseSchedule.ID)
	require.Equal(t, "TEST_CATEGORY_ID", newExpenseSchedule.ExpenseCategoryID)
	require.Equal(t, "TEST_LOCATION_ID", newExpenseSchedule.ExpenseLocationID)
}

func TestCreateExpenseScheduleService_NoCategoryLocation(t *testing.T) {
	expenseSchedule := model.ExpenseSchedule{
		Title:  "test_title",
		Amount: 2000,
		Memo:   "test_memo",
	}
	newExpenseSchedule, err := aSer.CreateExpenseScheduleService("user1", expenseSchedule)
	require.NoError(t, err)
	require.Equal(t, "new_expense_schedule_id", newExpenseSchedule.ID)
	require.Empty(t, newExpenseSchedule.ExpenseCategoryID)
	require.Empty(t, newExpenseSchedule.ExpenseLocationID)
}

func TestCreateExpenseScheduleService(t *testing.T) {
	expenseSchedule := model.ExpenseSchedule{
		Title:  "test_title",
		Amount: 2000,
		Memo:   "test_memo",
		ExpenseCategory: model.ExpenseCategory{
			Name: "new category",
		},
		ExpenseLocation: model.ExpenseLocation{
			Name: "new location",
		},
	}
	newExpenseSchedule, err := aSer.CreateExpenseScheduleService("user1", expenseSchedule)
	require.NoError(t, err)
	require.Equal(t, "new_expense_schedule_id", newExpenseSchedule.ID)
	require.Equal(t, "TEST_CATEGORY_ID", newExpenseSchedule.ExpenseCategoryID)
	require.Equal(t, "TEST_LOCATION_ID", newExpenseSchedule.ExpenseLocationID)
}
