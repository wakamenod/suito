package repositories

import (
	"testing"
	"time"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
	"github.com/wakamenod/suito/utils/testutils"
)

func TestFindScheduledIncomeQueues(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	now := time.Now().UTC()
	i.InsertScheduledIncomeQueue("schedule_01", now.Add(time.Hour*3))
	i.InsertScheduledIncomeQueue("schedule_02", now.Add(-time.Hour*3))
	// run
	res, err := NewSuitoRepository(tx).FindScheduledDueIncomeQueues()
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
	err := NewSuitoRepository(tx).DeleteScheduledIncomeQueues(params)
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
	err := NewSuitoRepository(tx).EnqueueIncomeSchedule()
	// check
	require.NoError(t, err)

	var founds []model.ScheduledIncomeQueue
	require.NoError(t, tx.Find(&founds).Order("income_schedule_id").Error)
	require.Equal(t, 3, len((founds)))
	require.Equal(t, id1, founds[0].IncomeScheduleID)
	require.Equal(t, id2, founds[1].IncomeScheduleID)
	require.Equal(t, id3, founds[2].IncomeScheduleID)
}
