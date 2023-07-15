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
		IncomeTypeID: incomeTypeID,
	}
	updateIncome, err := incomeSer.UpdateIncomeService("user1", income)
	require.NoError(t, err)
	require.Equal(t, income.ID, updateIncome.ID)
	require.Equal(t, income.IncomeTypeID, updateIncome.IncomeTypeID)
}
