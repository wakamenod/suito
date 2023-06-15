package repositories

import (
	"testing"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
	"github.com/wakamenod/suito/utils/testutils"
	"gorm.io/gorm"
)

func TestFindExpenseCategories(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	uid := "user01"
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertExpenseCategory(uid, "Category_01")
	i.InsertExpenseCategory("user99", "Category_01 Other User")
	i.InsertExpenseCategory(uid, "Category_02")
	// run
	res, err := NewSuitoRepository(tx).FindExpenseCategories(uid)
	// check
	require.NoError(t, err)
	require.Equal(t, 2, len(res))
	require.Equal(t, "Category_02", res[0].Name)
	require.Equal(t, "Category_01", res[1].Name)
}

func TestFindOrCreateExpenseCategory_New(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	// other user's data
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertExpenseCategory("user99", "NEW_CATEGORY")

	uid := "user01"
	// run
	res, err := NewSuitoRepository(tx).FindOrCreateExpenseCategory(uid, "NEW_CATEGORY")
	// check
	require.NoError(t, err)
	require.Equal(t, "NEW_CATEGORY", res.Name)
	require.Equal(t, uid, res.UID)
	require.NotEmpty(t, res.ID)

	var cnt int64
	tx.Model(&model.ExpenseCategory{}).Count(&cnt)
	require.EqualValues(t, 2, cnt)
}

func TestFindOrCreateExpenseCategory_Created(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	// other user's data
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertExpenseCategory("user99", "Category_02")

	category := i.InsertExpenseCategory("user01", "Category_02")
	// run
	res, err := NewSuitoRepository(tx).FindOrCreateExpenseCategory(category.UID, category.Name)
	// check
	require.NoError(t, err)
	require.Equal(t, category.Name, res.Name)
	require.Equal(t, category.UID, res.UID)
	require.Equal(t, category.ID, res.ID)

	var cnt int64
	tx.Model(&model.ExpenseCategory{}).Count(&cnt)
	require.EqualValues(t, 2, cnt)
}

func TestFindExpenseCategory(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	i := testutils.NewTestDataInserter(t, tx)
	category := i.InsertExpenseCategory("user01", "Category_02")
	// run
	res, err := NewSuitoRepository(tx).FindExpenseCategory(category.ID, category.UID)
	// check
	require.NoError(t, err)
	require.Equal(t, category.Name, res.Name)
	require.Equal(t, category.UID, res.UID)
	require.Equal(t, category.ID, res.ID)
}

func TestFindExpenseCategory_NotFound(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	i := testutils.NewTestDataInserter(t, tx)
	category := i.InsertExpenseCategory("user01", "Category_02")
	// run
	_, err := NewSuitoRepository(tx).FindExpenseCategory(category.ID, "user99")
	// check
	require.Error(t, err)
	require.ErrorIs(t, err, gorm.ErrRecordNotFound)
}

func TestHardDeleteAllUserExpenseCategories(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	userID := "user1"
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertExpenseCategory(userID, "Category_01")
	i.InsertExpenseCategory(userID, "Category_02")
	i.InsertExpenseCategory("user99", "Category_03")
	// run
	err := NewSuitoRepository(tx).HardDeleteAllUserExpenseCategories(userID)
	// check
	require.NoError(t, err)

	var found model.ExpenseCategory
	err = tx.Where("uid = ?", userID).Unscoped().First(&found).Error
	require.Error(t, err)
	require.ErrorIs(t, err, gorm.ErrRecordNotFound)

	var cnt int64
	tx.Model(&model.ExpenseCategory{}).Count(&cnt)
	require.EqualValues(t, 1, cnt)
}
