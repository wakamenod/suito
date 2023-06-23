package repositories

import (
	"testing"
	"time"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/utils/testutils"
	"gorm.io/gorm"
)

// An empty result set should not cause an error
func TestFindExpenseSchedules(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	// run
	res, err := NewSuitoRepository(tx).FindExpenseSchedules("")
	// check
	require.NoError(t, err)
	require.Empty(t, res)
}

// Other user's date should never be retrieved
func TestFindExpenseSchedules2(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	userID := "user1"
	i.InsertExpenseSchedule(userID, "title1", "America/New_York")
	i.InsertExpenseSchedule("user99", "title_other_user", "Asia/Tokyo")
	i.InsertExpenseSchedule(userID, "title2", "Asia/Tokyo",
		i.WithExpenseAmount(100),
		i.WithExpenseMemo("memo"),
		i.WithExpenseCategoryID("categoryID"),
		i.WithExpenseLocationID("locationID"),
	)
	i.InsertExpenseSchedule(userID, "", "",
		i.WithExpenseScheduleDeletedAt(gorm.DeletedAt{Valid: true, Time: time.Now()}),
	)
	// run
	res, err := NewSuitoRepository(tx).FindExpenseSchedules(userID)
	// check
	require.NoError(t, err)
	require.Equal(t, 2, len(res))
	{
		schedule := res[0]
		require.Equal(t, "title1", schedule.Title)
		require.Equal(t, "America/New_York", schedule.Timezone)
		require.Equal(t, 200, schedule.Amount)
		require.Equal(t, "", schedule.Memo)
		require.Equal(t, "", schedule.ExpenseCategoryID)
		require.Equal(t, "", schedule.ExpenseLocationID)
	}
	{
		schedule := res[1]
		require.Equal(t, "title2", schedule.Title)
		require.Equal(t, "Asia/Tokyo", schedule.Timezone)
		require.Equal(t, 100, schedule.Amount)
		require.Equal(t, "memo", schedule.Memo)
		require.Equal(t, "categoryID", schedule.ExpenseCategoryID)
		require.Equal(t, "locationID", schedule.ExpenseLocationID)
	}
}
