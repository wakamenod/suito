package testdata

import (
	"database/sql"
	"time"

	"github.com/wakamenod/suito/api/services/repositories"
	"github.com/wakamenod/suito/model"
	"gorm.io/gorm"
)

var TestRepositoryMock = repositories.RepositoryMock{
	FindExpensesFunc: func(uid string, start *time.Time, end *time.Time) ([]model.Expense, error) {
		return expenseTestData, nil
	},
	FindIncomesFunc: func(uid string, start *time.Time, end *time.Time) ([]model.Income, error) {
		return incomeTestData, nil
	},
	FindTransactionMonthsFunc: func(uid string) ([]string, error) {
		return []string{"2023-06", "2023-05", "2023-02"}, nil
	},
	FindExpenseCategoriesFunc: func(uid string) ([]model.ExpenseCategory, error) {
		return expenseCategoryTestData, nil
	},
	FindExpenseLocationsFunc: func(uid string) ([]model.ExpenseLocation, error) {
		return expenseLocationTestData, nil
	},
	CreateExpenseFunc: func(uid string, expense model.Expense) (model.Expense, error) {
		expense.ID = "new_expense_id"
		return expense, nil
	},
	CreateIncomeFunc: func(uid string, income model.Income) (model.Income, error) {
		income.ID = "new_income_id"
		return income, nil
	},
	FindExpenseFunc: func(id string, uid string) (model.Expense, error) {
		for _, ex := range expenseTestData {
			if id == ex.ID && uid == ex.UID {
				return ex, nil
			}
		}
		return model.Expense{}, gorm.ErrRecordNotFound
	},
	FindIncomeFunc: func(id string, uid string) (model.Income, error) {
		for _, ex := range incomeTestData {
			if id == ex.ID && uid == ex.UID {
				return ex, nil
			}
		}
		return model.Income{}, gorm.ErrRecordNotFound
	},
	FindIncomeTypesFunc: func(uid string) ([]model.IncomeType, error) {
		return incomeTypeTestData, nil
	},
	FindOrCreateExpenseCategoryFunc: func(uid string, name string) (model.ExpenseCategory, error) {
		return model.ExpenseCategory{ID: "TEST_CATEGORY_ID"}, nil
	},
	FindOrCreateExpenseLocationFunc: func(uid string, name string) (model.ExpenseLocation, error) {
		return model.ExpenseLocation{ID: "TEST_LOCATION_ID"}, nil
	},
	FindExpenseCategoryFunc: func(id string, uid string) (model.ExpenseCategory, error) {
		return model.ExpenseCategory{ID: "TEST_CATEGORY_ID", Name: "Test Category"}, nil
	},
	FindExpenseLocationFunc: func(id string, uid string) (model.ExpenseLocation, error) {
		return model.ExpenseLocation{ID: "TEST_LOCATION_ID", Name: "Test Location"}, nil
	},
	UpdateExpenseFunc: func(uid string, expense model.Expense) (model.Expense, error) {
		return expense, nil
	},
	DeleteExpenseFunc: func(id string, uid string) error {
		return nil
	},
	TransactionFunc: func(fc func(txRepo repositories.Repository) error, opts ...*sql.TxOptions) error {
		return fc(&repositories.RepositoryMock{})
	},
}
