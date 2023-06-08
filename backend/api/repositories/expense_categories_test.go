package repositories

import (
	"testing"
	"time"

	"github.com/rs/xid"
	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
)

func TestFindExpenseCategories(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	uid := "user01"
	require.NoError(t, tx.Create(&model.ExpenseCategory{
		ID:        xid.New().String(),
		Name:      "Category_01",
		UID:       uid,
		CreatedAt: time.Date(2023, 1, 1, 0, 0, 0, 0, time.UTC),
		UpdatedAt: time.Date(2023, 1, 1, 0, 0, 0, 0, time.UTC),
	}).Error, "failed to insert expense category")
	require.NoError(t, tx.Create(&model.ExpenseCategory{
		ID:        xid.New().String(),
		Name:      "Category_01 Other User",
		UID:       "user02",
		CreatedAt: time.Date(2023, 1, 1, 0, 0, 0, 0, time.UTC),
		UpdatedAt: time.Date(2023, 1, 1, 0, 0, 0, 0, time.UTC),
	}).Error, "failed to insert expense category")
	require.NoError(t, tx.Create(&model.ExpenseCategory{
		ID:        xid.New().String(),
		Name:      "Category_02",
		UID:       uid,
		CreatedAt: time.Date(2023, 5, 1, 0, 0, 0, 0, time.UTC),
		UpdatedAt: time.Date(2023, 1, 1, 0, 0, 0, 0, time.UTC),
	}).Error, "failed to insert expense category")
	// run
	res, err := NewSuitoRepository(tx).FindExpenseCategories(uid)
	// check
	require.NoError(t, err)
	require.Equal(t, 2, len(res))
	require.Equal(t, "Category_02", res[0].Name)
	require.Equal(t, "Category_01", res[1].Name)
}
