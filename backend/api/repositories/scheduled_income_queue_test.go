package repositories

import (
	"testing"
	"time"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
	"github.com/wakamenod/suito/utils/testutils"
	"gorm.io/gorm"
)

func TestFindScheduledIncomeQueues(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	now := time.Now().UTC()
	i.InsertScheduledIncomeQueue("schedule_01", now.Add(time.Hour*3), gorm.DeletedAt{})
	i.InsertScheduledIncomeQueue("schedule_02", now.Add(-time.Hour*3), gorm.DeletedAt{})
	i.InsertScheduledIncomeQueue("schedule_02", now.Add(-time.Hour*36), gorm.DeletedAt{Valid: true, Time: time.Now()})
	// run
	res, err := NewSuitoRepository(tx).FindScheduledIncomeQueues()
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
	params = append(params, i.InsertScheduledIncomeQueue("schedule_01", time.Now(), gorm.DeletedAt{}))
	params = append(params, i.InsertScheduledIncomeQueue("schedule_02", time.Now(), gorm.DeletedAt{}))
	// run
	err := NewSuitoRepository(tx).DeleteScheduledIncomeQueues(params)
	// check
	require.NoError(t, err)

	var founds []model.ScheduledIncomeQueue
	require.NoError(t, tx.Unscoped().Find(&founds).Order("id").Error)
	require.Equal(t, 2, len((founds)))
	require.True(t, founds[0].DeletedAt.Valid)
	require.True(t, founds[1].DeletedAt.Valid)
}

func TestEnqueuedIncomeSchedule(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	id1 := i.InsertIncomeSchedule("user1", "title01", "America/New_York").ID
	// run
	err := NewSuitoRepository(tx).EnqueuedIncomeSchedule()
	// check
	require.NoError(t, err)

	var founds []model.ScheduledIncomeQueue
	require.NoError(t, tx.Find(&founds).Order("id").Error)
	require.Equal(t, 1, len((founds)))
	require.False(t, founds[0].DeletedAt.Valid)
	require.Equal(t, id1, founds[0].IncomeScheduleID)
	// require.Equal(t, "", founds[0].ScheduledAt)
	// require.True(t, founds[1].DeletedAt.Valid)
}
