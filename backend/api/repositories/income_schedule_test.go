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
	res, err := NewSuitoIncomeScheduleRepository(tx).FindIncomeSchedules("")
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
	res, err := NewSuitoIncomeScheduleRepository(tx).FindIncomeSchedules(userID)
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
	res, err := NewSuitoIncomeScheduleRepository(tx).FindIncomeSchedule(id, userID)
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
	_, err := NewSuitoIncomeScheduleRepository(tx).FindIncomeSchedule("scheduleID", "user1")
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
	_, err := NewSuitoIncomeScheduleRepository(tx).UpdateIncomeSchedule(userID, targetIncomeSchedule)
	// check
	require.NoError(t, err)

	found, err := NewSuitoIncomeScheduleRepository(tx).FindIncomeSchedule(id, userID)
	require.NoError(t, err)
	require.Equal(t, "Test income type", found.IncomeType.Name)
	require.Equal(t, targetIncomeSchedule.Amount, found.Amount)
}

func TestUpdateIncomeSchedule_Deselect(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	userID := "user1"
	i := testutils.NewTestDataInserter(t, tx)
	id := i.InsertIncomeSchedule(userID, "Asia/Tokyo").ID
	targetIncomeSchedule := model.IncomeSchedule{
		ID:     id,
		Amount: 2000,
	}
	// run
	_, err := NewSuitoIncomeScheduleRepository(tx).UpdateIncomeSchedule(userID, targetIncomeSchedule)
	// check
	require.NoError(t, err)

	found, err := NewSuitoIncomeScheduleRepository(tx).FindIncomeSchedule(id, userID)
	require.NoError(t, err)
	require.Empty(t, found.IncomeType.Name)
	require.Empty(t, found.IncomeTypeID)
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
	err := NewSuitoIncomeScheduleRepository(tx).DeleteIncomeSchedule(id, userID)
	// check
	require.NoError(t, err)

	var found model.IncomeSchedule
	require.NoError(t, tx.Where("id = ? AND uid = ?", id, userID).Unscoped().First(&found).Error)
	require.NotNil(t, found.DeletedAt)
}

func TestCreateScheduleIncome(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	userID := "user1"
	incomeSchedule := model.IncomeSchedule{
		Amount:       2000,
		IncomeTypeID: "income_type_id",
		Timezone:     "Asia/Tokyo",
		Memo:         "test memo",
	}
	// run
	res, err := NewSuitoIncomeScheduleRepository(tx).CreateIncomeSchedule(userID, incomeSchedule)
	// check
	require.NoError(t, err)
	require.NotEmpty(t, res.ID)
	require.Equal(t, userID, res.UID)
	require.Equal(t, incomeSchedule.Amount, res.Amount)
	require.Equal(t, incomeSchedule.IncomeTypeID, res.IncomeTypeID)
	require.Equal(t, incomeSchedule.Timezone, res.Timezone)
	require.Equal(t, incomeSchedule.Memo, res.Memo)
}

func TestFindScheduledIncomeQueues(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	now := time.Now().UTC()
	i.InsertScheduledIncomeQueue("schedule_01", now.Add(time.Hour*3))
	i.InsertScheduledIncomeQueue("schedule_02", now.Add(-time.Hour*3))
	// run
	res, err := NewSuitoIncomeScheduleRepository(tx).FindScheduledDueIncomeQueues()
	// check
	require.NoError(t, err)
	require.Equal(t, 1, len(res))
}

func TestDeleteScheduledIncomeQueues(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	var params []model.ScheduledIncomeQueue
	params = append(params, i.InsertScheduledIncomeQueue("schedule_01", time.Now()))
	params = append(params, i.InsertScheduledIncomeQueue("schedule_02", time.Now()))
	// run
	err := NewSuitoIncomeScheduleRepository(tx).DeleteScheduledIncomeQueues(params)
	// check
	require.NoError(t, err)

	var founds []model.ScheduledIncomeQueue
	require.NoError(t, tx.Find(&founds).Order("income_schedule_id").Error)
	require.Equal(t, 0, len((founds)))
}

func TestEnqueuedIncomeSchedule(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	id1 := i.InsertIncomeSchedule("user1", "America/New_York").ID
	id2 := i.InsertIncomeSchedule("user1", "America/New_York").ID
	id3 := i.InsertIncomeSchedule("user99", "America/New_York").ID
	// run
	err := NewSuitoIncomeScheduleRepository(tx).EnqueueIncomeSchedule()
	// check
	require.NoError(t, err)

	var founds []model.ScheduledIncomeQueue
	require.NoError(t, tx.Find(&founds).Order("income_schedule_id").Error)
	require.Equal(t, 3, len((founds)))
	require.Equal(t, id1, founds[0].IncomeScheduleID)
	require.Equal(t, id2, founds[1].IncomeScheduleID)
	require.Equal(t, id3, founds[2].IncomeScheduleID)
}
