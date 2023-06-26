package services

import (
	"testing"
	"time"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/api/repositories"
	"github.com/wakamenod/suito/db/transaction"
	"github.com/wakamenod/suito/model"
	"github.com/wakamenod/suito/utils/testutils"
)

func TestCreateTransactionsService(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	userID := "userID1"
	{
		id := i.InsertExpenseSchedule(userID, "title01", "America/New_York").ID
		i.InsertScheduledExpenseQueue(id, time.Date(2023, 5, 1, 10, 0, 0, 0, time.UTC))
	}
	{
		id := i.InsertExpenseSchedule(userID, "title02", "Asia/Tokyo",
			i.WithExpenseMemo("TEST MEMO"),
			i.WithExpenseAmount(400),
			i.WithExpenseCategoryID("CID1"),
			i.WithExpenseLocationID("LID1"),
		).ID
		i.InsertScheduledExpenseQueue(id, time.Date(2023, 4, 30, 16, 0, 0, 0, time.UTC))
	}
	{
		id := i.InsertIncomeSchedule(userID, "America/New_York").ID
		i.InsertScheduledIncomeQueue(id, time.Date(2023, 5, 1, 10, 0, 0, 0, time.UTC))
	}
	{
		id := i.InsertIncomeSchedule(userID, "Asia/Tokyo",
			i.WithIncomeMemo("TEST MEMO"),
			i.WithIncomeAmount(400),
			i.WithIncomeTypeID("TID1"),
		).ID
		i.InsertScheduledIncomeQueue(id, time.Date(2023, 4, 30, 16, 0, 0, 0, time.UTC))
	}
	require.NoError(t, NewSuitoJobService(
		repositories.NewSuitoRepository(tx),
		transaction.NewSuitoTransactionProvider(tx),
		nil,
	).CreateTransactionsService())
	// Check
	{
		var founds []model.Expense
		require.NoError(t, tx.Where("uid = ?", userID).Find(&founds).Order("id").Error)
		require.Equal(t, 2, len((founds)))
		{
			found := founds[0]
			require.Equal(t, "title01", found.Title)
			require.Equal(t, "2023-05-01", found.LocalDate.Format("2006-01-02"))
			require.Equal(t, 200, found.Amount)
			require.Empty(t, found.Memo)
			require.Empty(t, found.ExpenseCategoryID)
			require.Empty(t, found.ExpenseLocationID)
			require.False(t, found.DeletedAt.Valid)
		}
		{
			found := founds[1]
			require.Equal(t, "title02", found.Title)
			require.Equal(t, "2023-05-01", found.LocalDate.Format("2006-01-02"))
			require.Equal(t, "TEST MEMO", found.Memo)
			require.Equal(t, 400, found.Amount)
			require.Equal(t, "CID1", found.ExpenseCategoryID)
			require.Equal(t, "LID1", found.ExpenseLocationID)
			require.False(t, found.DeletedAt.Valid)
		}
		var deletedSchedules []model.ScheduledExpenseQueue
		require.NoError(t, tx.Find(&deletedSchedules).Order("id").Error)
		require.Equal(t, 0, len((deletedSchedules)))
	}
	{
		var founds []model.Income
		require.NoError(t, tx.Where("uid = ?", userID).Find(&founds).Order("id").Error)
		require.Equal(t, 2, len((founds)))
		{
			found := founds[0]
			require.Equal(t, "2023-05-01", found.LocalDate.Format("2006-01-02"))
			require.Equal(t, 200, found.Amount)
			require.Empty(t, found.Memo)
			require.Empty(t, found.IncomeTypeID)
			require.False(t, found.DeletedAt.Valid)
		}
		{
			found := founds[1]
			require.Equal(t, "2023-05-01", found.LocalDate.Format("2006-01-02"))
			require.Equal(t, "TEST MEMO", found.Memo)
			require.Equal(t, 400, found.Amount)
			require.Equal(t, "TID1", found.IncomeTypeID)
			require.False(t, found.DeletedAt.Valid)
		}
		var deletedSchedules []model.ScheduledIncomeQueue
		require.NoError(t, tx.Find(&deletedSchedules).Order("id").Error)
		require.Equal(t, 0, len((deletedSchedules)))
	}

}

func TestListTransactionSchedulesService(t *testing.T) {
	userID := "userID1"
	resExpenses, resIncomes, err := aSer.ListTransactionSchedulesService(userID)
	require.NoError(t, err)
	{
		require.Equal(t, 2, len(resExpenses))
		require.Equal(t, "Title Expense 1", resExpenses[0].Title)
		require.Equal(t, 100, resExpenses[0].Amount)
		require.Equal(t, "Title Expense 2", resExpenses[1].Title)
		require.Equal(t, 200, resExpenses[1].Amount)
	}
	{
		require.Equal(t, 2, len(resIncomes))
		require.Equal(t, "Income Type 1", resIncomes[0].Title)
		require.Equal(t, 300, resIncomes[0].Amount)
		require.Equal(t, "Income Type 2", resIncomes[1].Title)
		require.Equal(t, 400, resIncomes[1].Amount)
	}
}
