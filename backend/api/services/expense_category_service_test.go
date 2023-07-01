package services

import (
	"testing"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
)

func TestCreateExpenseCategoryService(t *testing.T) {
	expenseCategory := model.ExpenseCategory{
		Name: "new category",
	}
	newExpenseCategory, err := expenseCategorySer.CreateExpenseCategoryService("user1", expenseCategory)
	require.NoError(t, err)
	require.Equal(t, "TEST_NEW_CATEGORY_ID", newExpenseCategory.ID)
	require.Equal(t, expenseCategory.Name, newExpenseCategory.Name)
}
