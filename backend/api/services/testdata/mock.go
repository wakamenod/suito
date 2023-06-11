package testdata

import (
	"time"

	"github.com/wakamenod/suito/model"
	"gorm.io/gorm"
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

func (r *RepositoryMock) FindExpenseLocations(uid string) ([]model.ExpenseLocation, error) {
	return expenseLocationTestData, nil
}

func (r *RepositoryMock) CreateExpense(uid string, expense model.Expense) (model.Expense, error) {
	expense.ID = "new_expense_id"
	return expense, nil
}

func (r *RepositoryMock) CreateIncome(uid string, income model.Income) (model.Income, error) {
	income.ID = "new_income_id"
	return income, nil
}

func (r *RepositoryMock) FindExpense(id, uid string) (model.Expense, error) {
	for _, ex := range expenseTestData {
		if id == ex.ID && uid == ex.UID {
			return ex, nil
		}
	}
	return model.Expense{}, gorm.ErrRecordNotFound
}

func (r *RepositoryMock) FindIncome(id, uid string) (model.Income, error) {
	for _, ex := range incomeTestData {
		if id == ex.ID && uid == ex.UID {
			return ex, nil
		}
	}
	return model.Income{}, gorm.ErrRecordNotFound
}

func (r *RepositoryMock) FindOrCreateExpenseCategory(uid string, name string) (model.ExpenseCategory, error) {
	return model.ExpenseCategory{ID: "TEST_CATEGORY_ID"}, nil
}

func (r *RepositoryMock) FindOrCreateExpenseLocation(uid string, name string) (model.ExpenseLocation, error) {
	return model.ExpenseLocation{ID: "TEST_LOCATION_ID"}, nil
}

func (r *RepositoryMock) FindExpenseCategory(id string, uid string) (model.ExpenseCategory, error) {
	return model.ExpenseCategory{ID: "TEST_CATEGORY_ID", Name: "Test Category"}, nil
}

func (r *RepositoryMock) FindExpenseLocation(id string, uid string) (model.ExpenseLocation, error) {
	return model.ExpenseLocation{ID: "TEST_LOCATION_ID", Name: "Test Location"}, nil
}

func (r *RepositoryMock) UpdateExpense(uid string, expense model.Expense) (model.Expense, error) {
	return expense, nil
}

func (r *RepositoryMock) DeleteExpense(id, uid string) error {
	return nil
}
