package repositories

import (
	"testing"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/utils/testutils"
)

func TestFindTransactionMonths(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertIncome("user1", "2023-05-01", "title01")
	i.InsertIncome("user2", "2023-05-02", "title02")
	i.InsertIncome("user1", "2023-05-03", "title03")
	i.InsertExpense("user1", "2022-04-01", "title01")
	i.InsertExpense("user2", "2023-05-02", "title02")
	i.InsertExpense("user1", "2021-06-03", "title03")
	// run
	res, err := NewSuitoRepository(tx).FindTransactionMonths("user1")
	// check
	require.NoError(t, err)
	require.Equal(t, 3, len(res))
	require.Equal(t, "2023-05", res[0])
	require.Equal(t, "2022-04", res[1])
	require.Equal(t, "2021-06", res[2])
}
