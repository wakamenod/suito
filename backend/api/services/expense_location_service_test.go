package services

import (
	"testing"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
)

func TestCreateExpenseLocationService(t *testing.T) {
	expenseLocation := model.ExpenseLocation{
		Name: "new location",
	}
	newExpenseLocation, err := expenseLocationSer.CreateExpenseLocationService("user1", expenseLocation)
	require.NoError(t, err)
	require.Equal(t, "TEST_NEW_LOCATION_ID", newExpenseLocation.ID)
	require.Equal(t, expenseLocation.Name, newExpenseLocation.Name)
}

func TestListExpenseLocationService(t *testing.T) {
	expenseLocations, err := expenseLocationSer.ListExpenseLocationService("user1")
	require.NoError(t, err)
	require.Equal(t, 2, len(expenseLocations))
}

func TestUpdateExpenseLocationService(t *testing.T) {
	expenseLocation := model.ExpenseLocation{
		ID:   "locationID",
		Name: "update location",
	}
	newExpenseLocation, err := expenseLocationSer.UpdateExpenseLocationService("user1", expenseLocation)
	require.NoError(t, err)
	require.Equal(t, expenseLocation.ID, newExpenseLocation.ID)
	require.Equal(t, expenseLocation.Name, newExpenseLocation.Name)
}

func TestDeleteExpenseLocationService(t *testing.T) {
	err := expenseLocationSer.DeleteExpenseLocationService("user1", "location_id")
	require.NoError(t, err)
}
