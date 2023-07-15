package services

import (
	"testing"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/api/repositories"
	"github.com/wakamenod/suito/db/transaction"
	"github.com/wakamenod/suito/model"
)

func TestUpdateIncomeScheduleService_NoIncomeType(t *testing.T) {
	incomeSchedule := model.IncomeSchedule{
		ID:     "update_target_incomeSchedule_id",
		Amount: 2000,
		Memo:   "test_memo",
	}
	newIncomeSchedule, err := incomeScheduleSer.UpdateIncomeScheduleService("user1", incomeSchedule)
	require.NoError(t, err)
	require.Equal(t, incomeSchedule.ID, newIncomeSchedule.ID)
	require.Empty(t, newIncomeSchedule.IncomeTypeID)
}

func TestUpdateIncomeScheduleService(t *testing.T) {
	incomeSchedule := model.IncomeSchedule{
		ID:           "update_target_incomeSchedule_id",
		Amount:       2000,
		Memo:         "test_memo",
		IncomeTypeID: "NewIncomeTypeID",
	}
	updateIncomeSchedule, err := incomeScheduleSer.UpdateIncomeScheduleService("user1", incomeSchedule)
	require.NoError(t, err)
	require.Equal(t, incomeSchedule.ID, updateIncomeSchedule.ID)
	require.Equal(t, incomeSchedule.IncomeTypeID, updateIncomeSchedule.IncomeTypeID)
}

func TestUpdateIncomeService_Deselect(t *testing.T) {
	incomeSchedule := model.IncomeSchedule{
		ID:           "update_target_incomeSchedule_id",
		Amount:       2000,
		Memo:         "test_memo",
		IncomeTypeID: "test_income_type_id",
	}
	updateIncomeSchedule, err := incomeScheduleSer.UpdateIncomeScheduleService("user1", incomeSchedule)
	require.NoError(t, err)
	require.Equal(t, incomeSchedule.ID, updateIncomeSchedule.ID)
	require.Equal(t, incomeSchedule.IncomeTypeID, updateIncomeSchedule.IncomeTypeID)
}

func TestCreateIncomeScheduleService_NoCategoryLocation(t *testing.T) {
	incomeSchedule := model.IncomeSchedule{
		Amount: 2000,
		Memo:   "test_memo",
	}
	newIncomeSchedule, err := incomeScheduleSer.CreateIncomeScheduleService("user1", incomeSchedule)
	require.NoError(t, err)
	require.Equal(t, "new_income_schedule_id", newIncomeSchedule.ID)
	require.Empty(t, newIncomeSchedule.IncomeTypeID)
}

func TestCreateIncomeScheduleService(t *testing.T) {
	incomeSchedule := model.IncomeSchedule{
		Amount:       2000,
		Memo:         "test_memo",
		IncomeTypeID: "NewIncomeTypeID",
	}
	newIncomeSchedule, err := incomeScheduleSer.CreateIncomeScheduleService("user1", incomeSchedule)
	require.NoError(t, err)
	require.Equal(t, "new_income_schedule_id", newIncomeSchedule.ID)
	require.Equal(t, incomeSchedule.IncomeTypeID, newIncomeSchedule.IncomeTypeID)
}

func TestCreateIncomeScheduleService_DBRepository(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	userID := "user1"

	incomeSchedule := model.IncomeSchedule{
		Amount:       2000,
		Memo:         "test_memo",
		IncomeTypeID: "new_income_type_id",
		Timezone:     "Asia/Tokyo",
	}

	res, err := NewSuitoIncomeScheduleService(
		repositories.NewSuitoIncomeScheduleRepository(tx),
		transaction.NewSuitoTransactionProvider(tx),
	).CreateIncomeScheduleService(userID, incomeSchedule)
	require.NoError(t, err)

	var founds []model.ScheduledIncomeQueue
	require.NoError(t, tx.Where("income_schedule_id = ?", res.ID).Find(&founds).
		Order("income_schedule_id").Error)
	require.Equal(t, 1, len((founds)))
}
