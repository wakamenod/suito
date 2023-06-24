package repositories

import (
	"database/sql"
	"time"

	"github.com/wakamenod/suito/api/repositories"
	"github.com/wakamenod/suito/model"
)

type Repository interface {
	Transaction(fc func(txRepo *repositories.SuitoRepository) error, opts ...*sql.TxOptions) (err error)
	FindExpense(id, uid string) (model.Expense, error)
	FindExpenses(uid string, start, end *time.Time) ([]model.Expense, error)
	FindIncome(id, uid string) (model.Income, error)
	FindIncomes(uid string, start, end *time.Time) ([]model.Income, error)
	FindIncomeTypes(uid string) ([]model.IncomeType, error)
	FindTransactionMonths(uid string) ([]string, error)
	FindExpenseCategories(uid string) ([]model.ExpenseCategory, error)
	FindExpenseLocations(uid string) ([]model.ExpenseLocation, error)
	CreateExpense(uid string, expense model.Expense) (model.Expense, error)
	CreateIncome(uid string, income model.Income) (model.Income, error)
	UpdateIncome(uid string, income model.Income) (model.Income, error)
	FindOrCreateExpenseCategory(uid string, name string) (model.ExpenseCategory, error)
	FindOrCreateExpenseLocation(uid string, name string) (model.ExpenseLocation, error)
	FindOrCreateIncomeType(uid string, name string) (model.IncomeType, error)
	FindExpenseCategory(id string, uid string) (model.ExpenseCategory, error)
	FindExpenseLocation(id string, uid string) (model.ExpenseLocation, error)
	UpdateExpense(uid string, expense model.Expense) (model.Expense, error)
	DeleteExpense(id, uid string) error
	FindOrCreateUser(uid string) (model.User, error)
	FindAllUIDs() ([]string, error)
	HardDeleteAllUserExpenseCategories(uid string) error
	HardDeleteAllUserExpenseLocations(uid string) error
	HardDeleteAllUserExpenses(uid string) error
	HardDeleteAllUserIncomes(uid string) error
	FindColumnChartExpenseData(uid string) ([]repositories.ColumnChartData, error)
	FindColumnChartIncomeData(uid string) ([]repositories.ColumnChartData, error)
	FindPieChartCategoryData(uid string, start, end *time.Time) ([]repositories.PieChartData, error)
	FindPieChartLocationData(uid string, start, end *time.Time) ([]repositories.PieChartData, error)
	FindExpenseSchedules(uid string) ([]model.ExpenseSchedule, error)
	FindIncomeSchedules(uid string) ([]model.IncomeSchedule, error)
	FindExpenseSchedule(id, uid string) (model.ExpenseSchedule, error)
	FindIncomeSchedule(id, uid string) (model.IncomeSchedule, error)
	UpdateExpenseSchedule(uid string, schedule model.ExpenseSchedule) (model.ExpenseSchedule, error)
	UpdateIncomeSchedule(uid string, schedule model.IncomeSchedule) (model.IncomeSchedule, error)
	DeleteExpenseSchedule(id, uid string) error
	DeleteIncomeSchedule(id, uid string) error
	CreateExpenseSchedule(uid string, expenseSchedule model.ExpenseSchedule) (model.ExpenseSchedule, error)
	CreateIncomeSchedule(uid string, incomeSchedule model.IncomeSchedule) (model.IncomeSchedule, error)
}
