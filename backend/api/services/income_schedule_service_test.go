package services

import (
	"testing"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
)

func TestUpdateIncomeScheduleService_NoIncomeType(t *testing.T) {
	incomeSchedule := model.IncomeSchedule{
		ID:     "update_target_incomeSchedule_id",
		Amount: 2000,
		Memo:   "test_memo",
	}
	newIncomeSchedule, err := aSer.UpdateIncomeScheduleService("user1", incomeSchedule)
	require.NoError(t, err)
	require.Equal(t, incomeSchedule.ID, newIncomeSchedule.ID)
	require.Empty(t, newIncomeSchedule.IncomeTypeID)
}

func TestUpdateIncomeScheduleService(t *testing.T) {
	incomeSchedule := model.IncomeSchedule{
		ID:     "update_target_incomeSchedule_id",
		Amount: 2000,
		Memo:   "test_memo",
		IncomeType: model.IncomeType{
			Name: "new type",
		},
	}
	updateIncomeSchedule, err := aSer.UpdateIncomeScheduleService("user1", incomeSchedule)
	require.NoError(t, err)
	require.Equal(t, incomeSchedule.ID, updateIncomeSchedule.ID)
	require.Equal(t, "NewIncomeTypeID", updateIncomeSchedule.IncomeTypeID)
	require.Equal(t, "NewIncomeTypeID", updateIncomeSchedule.IncomeType.ID)
	require.Equal(t, incomeSchedule.IncomeType.Name, updateIncomeSchedule.IncomeType.Name)
}

func TestCreateIncomeScheduleService_NoCategoryLocation(t *testing.T) {
	incomeSchedule := model.IncomeSchedule{
		Amount: 2000,
		Memo:   "test_memo",
	}
	newIncomeSchedule, err := aSer.CreateIncomeScheduleService("user1", incomeSchedule)
	require.NoError(t, err)
	require.Equal(t, "new_income_schedule_id", newIncomeSchedule.ID)
	require.Empty(t, newIncomeSchedule.IncomeTypeID)
}

func TestCreateIncomeScheduleService(t *testing.T) {
	incomeSchedule := model.IncomeSchedule{
		Amount: 2000,
		Memo:   "test_memo",
		IncomeType: model.IncomeType{
			Name: "new income type",
		},
	}
	newIncomeSchedule, err := aSer.CreateIncomeScheduleService("user1", incomeSchedule)
	require.NoError(t, err)
	require.Equal(t, "new_income_schedule_id", newIncomeSchedule.ID)
	require.Equal(t, "NewIncomeTypeID", newIncomeSchedule.IncomeTypeID)
}
