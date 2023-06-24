package repositories

import (
	"testing"
	"time"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
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
	i.InsertIncomeSchedule(userID, "America/New_York")
	i.InsertIncomeSchedule("user99", "Asia/Tokyo")
	i.InsertIncomeSchedule(userID, "Asia/Tokyo",
		i.WithIncomeAmount(100),
		i.WithIncomeMemo("memo"),
		i.WithIncomeTypeID(incomeTypeID),
	)
	i.InsertIncomeSchedule(userID, "",
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

func TestFindIncomeSchedule(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	userID := "user1"
	typeID := i.InsertIncomeType(userID, "Income Type").ID
	id := i.InsertIncomeSchedule(userID, "Asia/Tokyo", i.WithIncomeTypeID(typeID)).ID
	// run
	res, err := NewSuitoRepository(tx).FindIncomeSchedule(id, userID)
	// check
	require.NoError(t, err)
	require.Equal(t, id, res.ID)
	require.Equal(t, "Income Type", res.IncomeType.Name)
	require.Equal(t, 200, res.Amount)
}

func TestFindIncomeSchedule_ErrorNotFound(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	// i := testutils.NewTestDataInserter(t, tx)
	// run
	_, err := NewSuitoRepository(tx).FindIncomeSchedule("scheduleID", "user1")
	// check
	require.Error(t, err)
	require.ErrorIs(t, err, gorm.ErrRecordNotFound)
}

func TestUpdateIncomeSchedule(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	userID := "user1"
	i := testutils.NewTestDataInserter(t, tx)
	id := i.InsertIncomeSchedule(userID, "Asia/Tokyo").ID
	i.InsertIncomeSchedule("user99", "Asia/Tokyo")
	i.InsertIncomeSchedule(userID, "Asia/Tokyo")
	typeID := i.InsertIncomeType(userID, "Test income type").ID
	targetIncomeSchedule := model.IncomeSchedule{
		ID:           id,
		Amount:       2000,
		IncomeTypeID: typeID,
	}
	// run
	_, err := NewSuitoRepository(tx).UpdateIncomeSchedule(userID, targetIncomeSchedule)
	// check
	require.NoError(t, err)

	found, err := NewSuitoRepository(tx).FindIncomeSchedule(id, userID)
	require.NoError(t, err)
	require.Equal(t, "Test income type", found.IncomeType.Name)
	require.Equal(t, targetIncomeSchedule.Amount, found.Amount)
}

func TestDeleteIncomeSchedule(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	userID := "user1"
	i := testutils.NewTestDataInserter(t, tx)
	id := i.InsertIncomeSchedule(userID, "Asia/Tokyo").ID
	i.InsertIncomeSchedule("user99", "Asia/Tokyo")
	i.InsertIncomeSchedule(userID, "Asia/Tokyo")
	// run
	err := NewSuitoRepository(tx).DeleteIncomeSchedule(id, userID)
	// check
	require.NoError(t, err)

	var found model.IncomeSchedule
	require.NoError(t, tx.Where("id = ? AND uid = ?", id, userID).Unscoped().First(&found).Error)
	require.NotNil(t, found.DeletedAt)
}
