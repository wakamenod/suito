package services

import (
	"testing"

	"github.com/stretchr/testify/require"
	"gorm.io/gorm"
)

func TestFindExpenseService(t *testing.T) {
	res, err := aSer.FindExpenseService("ID_EXPENSE_02", "user1")
	require.NoError(t, err)
	require.Equal(t, 200, res.Amount)
	require.Equal(t, "Test002", res.Title)
}

func TestFindExpenseService_Error(t *testing.T) {
	_, err := aSer.FindExpenseService("ID_EXPENSE_02", "user2")
	require.Error(t, err)
	require.ErrorIs(t, err, gorm.ErrRecordNotFound)
}
