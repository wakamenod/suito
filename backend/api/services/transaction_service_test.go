package services

import (
	"testing"

	"github.com/stretchr/testify/require"
)

func TestListTransactionService(t *testing.T) {
	res, err := transactionSer.ListTransactionsService("", nil, nil)
	require.NoError(t, err)
	require.Equal(t, 5, len(res))
	require.Equal(t, "Test003", res[0].Title)
	require.Equal(t, 200, res[0].Amount)
	require.Equal(t, "Test Income Type 02", res[1].Title)
	require.Equal(t, 200, res[1].Amount)
	require.Equal(t, "Test002", res[2].Title)
	require.Equal(t, 200, res[2].Amount)
	require.Equal(t, "Test Income Type 01", res[3].Title)
	require.Equal(t, 100, res[3].Amount)
	require.Equal(t, "Test001", res[4].Title)
	require.Equal(t, 100, res[4].Amount)
}
