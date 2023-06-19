package services

import (
	"time"

	"github.com/wakamenod/suito/api/repositories"
	"github.com/wakamenod/suito/api/services"
	"github.com/wakamenod/suito/model"
)

type TransactionsService interface {
	ListTransactionsService(uid string, start, end *time.Time) ([]services.Transaction, error)
	TransactionMonthsService(uid string) ([]string, error)
}

type ExpenseService interface {
	ListExpenseCategoryService(uid string) ([]model.ExpenseCategory, error)
	ListExpenseLocationService(uid string) ([]model.ExpenseLocation, error)
	CreateExpenseService(uid string, expense model.Expense, categoryName, locationName string) (model.Expense, error)
	UpdateExpenseService(uid string, expense model.Expense, categoryName, locationName string) (model.Expense, error)
	DeleteExpenseService(id, uid string) error
	FindExpenseService(id, uid string) (model.Expense, string, string, error)
}

type IncomeService interface {
	CreateIncomeService(uid string, income model.Income) (model.Income, error)
	FindIncomeService(id, uid string) (model.Income, error)
	ListIncomeTypesService(uid string) ([]model.IncomeType, error)
}

type ChartService interface {
	ColumnChartService(uid string) ([]services.ColumnChartCategoryData, []services.ColumnChartCategoryData, error)
	PieChartService(uid string, start, end *time.Time) ([]repositories.PieChartData, []repositories.PieChartData, error)
}
