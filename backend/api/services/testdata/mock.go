package testdata

import (
	"time"

	"github.com/wakamenod/suito/model"
)

type RepositoryMock struct{}

func NewRepositoryMock() *RepositoryMock {
	return &RepositoryMock{}
}

func (r *RepositoryMock) FindExpenses(uid string, start, end *time.Time) ([]model.Expense, error) {
	return expenseTestData, nil
}

func (r *RepositoryMock) FindIncomes(uid string, start, end *time.Time) ([]model.Income, error) {
	return incomeTestData, nil
}

func (r *RepositoryMock) FindTransactionMonths(uid string) ([]string, error) {
	return []string{"2023-06", "2023-05", "2023-02"}, nil
}

func (r *RepositoryMock) FindExpenseCategories(uid string) ([]model.ExpenseCategory, error) {
	return expenseCategoryTestData, nil
}
