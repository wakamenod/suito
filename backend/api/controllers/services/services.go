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
	CreateExpenseService(uid string, expense model.Expense) (model.Expense, error)
	UpdateExpenseService(uid string, expense model.Expense) (model.Expense, error)
	DeleteExpenseService(id, uid string) error
	FindExpenseService(id, uid string) (model.Expense, error)
}

type ExpenseCategoryService interface {
	ListExpenseCategoryService(uid string) ([]model.ExpenseCategory, error)
	CreateExpenseCategoryService(uid string, category model.ExpenseCategory) (model.ExpenseCategory, error)
	UpdateExpenseCategoryService(uid string, category model.ExpenseCategory) (model.ExpenseCategory, error)
	DeleteExpenseCategoryService(id, uid string) error
}

type ExpenseLocationService interface {
	ListExpenseLocationService(uid string) ([]model.ExpenseLocation, error)
	CreateExpenseLocationService(uid string, location model.ExpenseLocation) (model.ExpenseLocation, error)
	UpdateExpenseLocationService(uid string, location model.ExpenseLocation) (model.ExpenseLocation, error)
	DeleteExpenseLocationService(id, uid string) error
}

type ExpenseScheduleService interface {
	FindExpenseScheduleService(id, uid string) (model.ExpenseSchedule, error)
	UpdateExpenseScheduleService(uid string, expenseSchedule model.ExpenseSchedule) (model.ExpenseSchedule, error)
	DeleteExpenseScheduleService(id, uid string) error
	CreateExpenseScheduleService(uid string, expenseSchedule model.ExpenseSchedule) (model.ExpenseSchedule, error)
}

type IncomeTypeService interface {
	ListIncomeTypesService(uid string) ([]model.IncomeType, error)
	CreateIncomeTypeService(uid string, location model.IncomeType) (model.IncomeType, error)
	UpdateIncomeTypeService(uid string, location model.IncomeType) (model.IncomeType, error)
	DeleteIncomeTypeService(id, uid string) error
}

type IncomeScheduleService interface {
	FindIncomeScheduleService(id, uid string) (model.IncomeSchedule, error)
	UpdateIncomeScheduleService(uid string, incomeSchedule model.IncomeSchedule) (model.IncomeSchedule, error)
	DeleteIncomeScheduleService(id, uid string) error
	CreateIncomeScheduleService(uid string, incomeSchedule model.IncomeSchedule) (model.IncomeSchedule, error)
}

type IncomeService interface {
	CreateIncomeService(uid string, income model.Income) (model.Income, error)
	FindIncomeService(id, uid string) (model.Income, error)
	UpdateIncomeService(uid string, income model.Income) (model.Income, error)
}

type ChartService interface {
	ColumnChartService(uid string) ([]services.ColumnChartCategoryData, []services.ColumnChartCategoryData, error)
	PieChartService(uid string, start, end *time.Time) ([]repositories.PieChartData, []repositories.PieChartData, error)
}

type TransactionScheduleService interface {
	ListTransactionSchedulesService(uid string) ([]services.TransactionSchedule, []services.TransactionSchedule, error)
}
