package services

import (
	"testing"

	"github.com/stretchr/testify/require"
)

func TestListTransactionService(t *testing.T) {
	res, err := aSer.ListTransactionsService("", nil, nil)
	require.NoError(t, err)
	require.Equal(t, 4, len(res))
}
