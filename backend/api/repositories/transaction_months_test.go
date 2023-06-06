package repositories

import (
	"testing"

	"github.com/stretchr/testify/require"
)

func TestFindTransactionMonths(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := newIncomeInserter(t, tx)
	e := newExpenseInserter(t, tx)
	i.mustInsert("user1", "2023-05-01", "title01")
	i.mustInsert("user2", "2023-05-02", "title02")
	i.mustInsert("user1", "2023-05-03", "title03")
	e.mustInsert("user1", "2022-04-01", "title01")
	e.mustInsert("user2", "2023-05-02", "title02")
	e.mustInsert("user1", "2021-06-03", "title03")
	// run
	res, err := NewSuitoRepository(tx).FindTransactionMonths("user1")
	// check
	require.NoError(t, err)
	require.Equal(t, 3, len(res))
	require.Equal(t, "2023-05", res[0])
	require.Equal(t, "2022-04", res[1])
	require.Equal(t, "2021-06", res[2])
}
