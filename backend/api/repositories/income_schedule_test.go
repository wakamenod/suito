package repositories

import (
	"testing"
	"time"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/utils/testutils"
	"gorm.io/gorm"
)

// An empty result set should not cause an error
func TestFindIncomeSchedules(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	// run
	res, err := NewSuitoRepository(tx).FindIncomeSchedules("")
	// check
	require.NoError(t, err)
	require.Empty(t, res)
}

// Other user's date should never be retrieved
func TestFindIncomeSchedules2(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	userID := "user1"
	incomeTypeID := i.InsertIncomeType(userID, "収入A").ID
	i.InsertIncomeSchedule(userID, "title1", "America/New_York")
	i.InsertIncomeSchedule("user99", "title_other_user", "Asia/Tokyo")
	i.InsertIncomeSchedule(userID, "title2", "Asia/Tokyo",
		i.WithIncomeAmount(100),
		i.WithIncomeMemo("memo"),
		i.WithIncomeTypeID(incomeTypeID),
	)
	i.InsertIncomeSchedule(userID, "", "",
		i.WithIncomeScheduleDeletedAt(gorm.DeletedAt{Valid: true, Time: time.Now()}),
	)
	// run
	res, err := NewSuitoRepository(tx).FindIncomeSchedules(userID)
	// check
	require.NoError(t, err)
	require.Equal(t, 2, len(res))
	{
		schedule := res[0]
		require.Equal(t, "", schedule.IncomeType.Name)
		require.Equal(t, "America/New_York", schedule.Timezone)
		require.Equal(t, 200, schedule.Amount)
		require.Equal(t, "", schedule.Memo)
	}
	{
		schedule := res[1]
		require.Equal(t, "収入A", schedule.IncomeType.Name)
		require.Equal(t, "Asia/Tokyo", schedule.Timezone)
		require.Equal(t, 100, schedule.Amount)
		require.Equal(t, "memo", schedule.Memo)
	}
}
