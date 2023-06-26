package repositories

import (
	"testing"
	"time"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
	"github.com/wakamenod/suito/utils/testutils"
)

func TestFindScheduledExpenseQueues(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	now := time.Now().UTC()
	i.InsertScheduledExpenseQueue("schedule_01", now.Add(time.Hour*3))
	i.InsertScheduledExpenseQueue("schedule_02", now.Add(-time.Hour*3))
	// run
	res, err := NewSuitoRepository(tx).FindScheduledDueExpenseQueues()
	// check
	require.NoError(t, err)
	require.Equal(t, 1, len(res))
	require.Equal(t, "schedule_02", res[0].ExpenseScheduleID)
}

func TestDeleteScheduledExpenseQueues(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	var params []model.ScheduledExpenseQueue
	params = append(params, i.InsertScheduledExpenseQueue("schedule_01", time.Now()))
	params = append(params, i.InsertScheduledExpenseQueue("schedule_02", time.Now()))
	// run
	err := NewSuitoRepository(tx).DeleteScheduledExpenseQueues(params)
	// check
	require.NoError(t, err)

	var founds []model.ScheduledExpenseQueue
	require.NoError(t, tx.Find(&founds).Order("expense_schedule_id").Error)
	require.Equal(t, 0, len((founds)))
}

func TestEnqueuedExpenseSchedule(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	id1 := i.InsertExpenseSchedule("user1", "title1", "America/New_York").ID
	id2 := i.InsertExpenseSchedule("user1", "title2", "America/New_York").ID
	id3 := i.InsertExpenseSchedule("user99", "title3", "America/New_York").ID
	// run
	err := NewSuitoRepository(tx).EnqueueExpenseSchedule()
	// check
	require.NoError(t, err)

	var founds []model.ScheduledExpenseQueue
	require.NoError(t, tx.Find(&founds).Order("expense_schedule_id").Error)
	require.Equal(t, 3, len((founds)))
	require.Equal(t, id1, founds[0].ExpenseScheduleID)
	require.Equal(t, id2, founds[1].ExpenseScheduleID)
	require.Equal(t, id3, founds[2].ExpenseScheduleID)
}
