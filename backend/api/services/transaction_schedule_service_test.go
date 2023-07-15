package services

import (
	"testing"

	"github.com/stretchr/testify/require"
)

func TestListTransactionSchedulesService(t *testing.T) {
	userID := "userID1"
	resExpenses, resIncomes, err := transactionScheduleSer.ListTransactionSchedulesService(userID)
	require.NoError(t, err)
	{
		require.Equal(t, 2, len(resExpenses))
		require.Equal(t, "Title Expense 1", resExpenses[0].Title)
		require.Equal(t, 100, resExpenses[0].Amount)
		require.Equal(t, "Title Expense 2", resExpenses[1].Title)
		require.Equal(t, 200, resExpenses[1].Amount)
	}
	{
		require.Equal(t, 2, len(resIncomes))
		require.Equal(t, "Test Income Type 01", resIncomes[0].Title)
		require.Equal(t, 300, resIncomes[0].Amount)
		require.Equal(t, "Test Income Type 02", resIncomes[1].Title)
		require.Equal(t, 400, resIncomes[1].Amount)
	}
}
