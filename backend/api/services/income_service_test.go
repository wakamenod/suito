package services

import (
	"testing"
	"time"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
)

func TestCreateIncomeService_NoCategoryLocation(t *testing.T) {
	income := model.Income{
		LocalDate: time.Date(2023, 5, 3, 0, 0, 0, 0, time.UTC),
		Amount:    2000,
		Memo:      "test_memo",
	}
	newIncome, err := aSer.CreateIncomeService("user1", income)
	require.NoError(t, err)
	require.Equal(t, "new_income_id", newIncome.ID)
	require.Empty(t, newIncome.IncomeTypeID)
	require.Empty(t, newIncome.IncomeType.Name)
}

// func TestCreateIncomeService(t *testing.T) {
// 	income := model.Income{
// 		Title:     "test_title",
// 		LocalDate: time.Date(2023, 5, 3, 0, 0, 0, 0, time.UTC),
// 		Amount:    2000,
// 		Memo:      "test_memo",
// 	}
// 	newIncome, err := aSer.CreateIncomeService("user1", income, "Test Category", "Test Location")
// 	require.NoError(t, err)
// 	require.Equal(t, "new_income_id", newIncome.ID)
// 	require.Equal(t, "TEST_CATEGORY_ID", newIncome.IncomeCategoryID)
// 	require.Equal(t, "TEST_LOCATION_ID", newIncome.IncomeLocationID)
// }
