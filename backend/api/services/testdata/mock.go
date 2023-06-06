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
