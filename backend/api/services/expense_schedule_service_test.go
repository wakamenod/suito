package services

import (
	"testing"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/api/repositories"
	"github.com/wakamenod/suito/db/transaction"
	"github.com/wakamenod/suito/model"
)

func TestUpdateExpenseScheduleService_NoCategoryLocation(t *testing.T) {
	expenseSchedule := model.ExpenseSchedule{
		ID:     "update_target_expenseSchedule_id",
		Title:  "test_title",
		Amount: 2000,
		Memo:   "test_memo",
	}
	newExpenseSchedule, err := expenseScheduleSer.UpdateExpenseScheduleService("user1", expenseSchedule)
	require.NoError(t, err)
	require.Equal(t, expenseSchedule.ID, newExpenseSchedule.ID)
	require.Empty(t, newExpenseSchedule.ExpenseCategoryID)
	require.Empty(t, newExpenseSchedule.ExpenseLocationID)
}

func TestUpdateExpenseScheduleService(t *testing.T) {
	expenseSchedule := model.ExpenseSchedule{
		ID:                "update_target_expenseSchedule_id",
		Title:             "test_title",
		Amount:            2000,
		Memo:              "test_memo",
		ExpenseCategoryID: "TEST_CATEGORY_ID",
		ExpenseLocationID: "TEST_LOCATION_ID",
	}
	newExpenseSchedule, err := expenseScheduleSer.UpdateExpenseScheduleService("user1", expenseSchedule)
	require.NoError(t, err)
	require.Equal(t, expenseSchedule.ID, newExpenseSchedule.ID)
	require.Equal(t, expenseSchedule.ExpenseCategoryID, newExpenseSchedule.ExpenseCategoryID)
	require.Equal(t, expenseSchedule.ExpenseLocationID, newExpenseSchedule.ExpenseLocationID)
}

func TestCreateExpenseScheduleService_NoCategoryLocation(t *testing.T) {
	expenseSchedule := model.ExpenseSchedule{
		Title:  "test_title",
		Amount: 2000,
		Memo:   "test_memo",
	}
	newExpenseSchedule, err := expenseScheduleSer.CreateExpenseScheduleService("user1", expenseSchedule)
	require.NoError(t, err)
	require.Equal(t, "new_expense_schedule_id", newExpenseSchedule.ID)
	require.Empty(t, newExpenseSchedule.ExpenseCategoryID)
	require.Empty(t, newExpenseSchedule.ExpenseLocationID)
}

func TestCreateExpenseScheduleService(t *testing.T) {
	expenseSchedule := model.ExpenseSchedule{
		Title:             "test_title",
		Amount:            2000,
		Memo:              "test_memo",
		ExpenseCategoryID: "TEST_CATEGORY_ID",
		ExpenseLocationID: "TEST_LOCATION_ID",
	}
	newExpenseSchedule, err := expenseScheduleSer.CreateExpenseScheduleService("user1", expenseSchedule)
	require.NoError(t, err)
	require.Equal(t, "new_expense_schedule_id", newExpenseSchedule.ID)
	require.Equal(t, expenseSchedule.ExpenseCategoryID, newExpenseSchedule.ExpenseCategoryID)
	require.Equal(t, expenseSchedule.ExpenseLocationID, newExpenseSchedule.ExpenseLocationID)
}

func TestCreateExpenseScheduleService_DBRepository(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	userID := "user1"

	expenseSchedule := model.ExpenseSchedule{
		Amount:   2000,
		Memo:     "test_memo",
		Timezone: "Asia/Tokyo",
	}

	res, err := NewSuitoExpenseScheduleService(
		repositories.NewSuitoExpenseScheduleRepository(tx),
		transaction.NewSuitoTransactionProvider(tx),
	).CreateExpenseScheduleService(userID, expenseSchedule)
	require.NoError(t, err)

	var founds []model.ScheduledExpenseQueue
	require.NoError(t, tx.Where("expense_schedule_id = ?", res.ID).Find(&founds).
		Order("expense_schedule_id").Error)
	require.Equal(t, 1, len((founds)))
}
