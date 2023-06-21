package repositories

import (
	"testing"
	"time"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
	"github.com/wakamenod/suito/utils/testutils"
	"gorm.io/gorm"
)

func TestFindScheduledExpenseQueues(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	now := time.Now().UTC()
	i.InsertScheduledExpenseQueue("schedule_01", now.Add(time.Hour*3), gorm.DeletedAt{})
	i.InsertScheduledExpenseQueue("schedule_02", now.Add(-time.Hour*3), gorm.DeletedAt{})
	i.InsertScheduledExpenseQueue("schedule_02", now.Add(-time.Hour*36), gorm.DeletedAt{Valid: true, Time: now})
	// run
	res, err := NewSuitoRepository(tx).FindScheduledExpenseQueues()
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
	params = append(params, i.InsertScheduledExpenseQueue("schedule_01", time.Now(), gorm.DeletedAt{}))
	params = append(params, i.InsertScheduledExpenseQueue("schedule_02", time.Now(), gorm.DeletedAt{}))
	// run
	err := NewSuitoRepository(tx).DeleteScheduledExpenseQueues(params)
	// check
	require.NoError(t, err)

	var founds []model.ScheduledExpenseQueue
	require.NoError(t, tx.Unscoped().Find(&founds).Order("id").Error)
	require.Equal(t, 2, len((founds)))
	require.True(t, founds[0].DeletedAt.Valid)
	require.True(t, founds[1].DeletedAt.Valid)
}

func TestEnqueuedExpenseSchedule(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	id1 := i.InsertExpenseSchedule("user1", "title01", "America/New_York").ID
	// run
	err := NewSuitoRepository(tx).EnqueuedExpenseSchedule()
	// check
	require.NoError(t, err)

	var founds []model.ScheduledExpenseQueue
	require.NoError(t, tx.Find(&founds).Order("id").Error)
	require.Equal(t, 1, len((founds)))
	require.False(t, founds[0].DeletedAt.Valid)
	require.Equal(t, id1, founds[0].ExpenseScheduleID)
	// require.Equal(t, "", founds[0].ScheduledAt)
	// require.True(t, founds[1].DeletedAt.Valid)
}
