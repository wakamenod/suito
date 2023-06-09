package services

import (
	"testing"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
)

func TestCreateIncomeTypeService(t *testing.T) {
	incomeType := model.IncomeType{
		Name: "new incomeType",
	}
	newIncomeType, err := incomeTypeSer.CreateIncomeTypeService("user1", incomeType)
	require.NoError(t, err)
	require.Equal(t, "TEST_NEW_INCOME_TYPE_ID", newIncomeType.ID)
	require.Equal(t, incomeType.Name, newIncomeType.Name)
}

func TestListIncomeTypeService(t *testing.T) {
	incomeTypes, err := incomeTypeSer.ListIncomeTypesService("user1")
	require.NoError(t, err)
	require.Equal(t, 2, len(incomeTypes))
}

func TestUpdateIncomeTypeService(t *testing.T) {
	incomeType := model.IncomeType{
		ID:   "incomeTypeID",
		Name: "update incomeType",
	}
	newIncomeType, err := incomeTypeSer.UpdateIncomeTypeService("user1", incomeType)
	require.NoError(t, err)
	require.Equal(t, incomeType.ID, newIncomeType.ID)
	require.Equal(t, incomeType.Name, newIncomeType.Name)
}

func TestDeleteIncomeTypeService(t *testing.T) {
	err := incomeTypeSer.DeleteIncomeTypeService("user1", "location_id")
	require.NoError(t, err)
}
