package services

import (
	"testing"
	"time"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
)

func TestCreateIncomeService_NoIncomeType(t *testing.T) {
	income := model.Income{
		LocalDate: time.Date(2023, 5, 3, 0, 0, 0, 0, time.UTC),
		Amount:    2000,
		Memo:      "test_memo",
	}
	newIncome, err := incomeSer.CreateIncomeService("user1", income)
	require.NoError(t, err)
	require.Equal(t, "new_income_id", newIncome.ID)
	require.Empty(t, newIncome.IncomeTypeID)
	require.Empty(t, newIncome.IncomeType.Name)
}

func TestCreateIncomeService(t *testing.T) {
	income := model.Income{
		LocalDate:    time.Date(2023, 5, 3, 0, 0, 0, 0, time.UTC),
		Amount:       2000,
		Memo:         "test_memo",
		IncomeTypeID: "NewIncomeTypeID",
	}
	newIncome, err := incomeSer.CreateIncomeService("user1", income)
	require.NoError(t, err)
	require.Equal(t, "new_income_id", newIncome.ID)
	require.Equal(t, income.IncomeType.Name, newIncome.IncomeType.Name)
	require.Equal(t, income.IncomeType.ID, newIncome.IncomeType.ID)
	require.Equal(t, income.IncomeTypeID, newIncome.IncomeTypeID)
}

func TestUpdateIncomeService_NoIncomeType(t *testing.T) {
	income := model.Income{
		ID:        "update_target_income_id",
		LocalDate: time.Date(2023, 5, 3, 0, 0, 0, 0, time.UTC),
		Amount:    2000,
		Memo:      "test_memo",
	}
	newIncome, err := incomeSer.UpdateIncomeService("user1", income)
	require.NoError(t, err)
	require.Equal(t, income.ID, newIncome.ID)
}

func TestUpdateIncomeService(t *testing.T) {
	incomeTypeID := "incomeTypeID"
	income := model.Income{
		ID:           "update_target_income_id",
		LocalDate:    time.Date(2023, 5, 3, 0, 0, 0, 0, time.UTC),
		Amount:       2000,
		Memo:         "test_memo",
		IncomeType:   model.IncomeType{ID: incomeTypeID, Name: "NewName"},
		IncomeTypeID: incomeTypeID,
	}
	updateIncome, err := incomeSer.UpdateIncomeService("user1", income)
	require.NoError(t, err)
	require.Equal(t, income.ID, updateIncome.ID)
	require.Equal(t, income.IncomeTypeID, updateIncome.IncomeTypeID)
}
