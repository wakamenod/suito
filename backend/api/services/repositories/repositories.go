package repositories

import (
	"time"

	"github.com/wakamenod/suito/api/repositories"
	"github.com/wakamenod/suito/db/transaction"
	"github.com/wakamenod/suito/model"
)

type ExpenseCategoryRepository interface {
	FindExpenseCategories(uid string) ([]model.ExpenseCategory, error)
	FindExpenseCategory(id string, uid string) (model.ExpenseCategory, error)
	CreateExpenseCategory(uid string, expenseCategory model.ExpenseCategory) (model.ExpenseCategory, error)
	UpdateExpenseCategory(uid string, expenseCategory model.ExpenseCategory) (model.ExpenseCategory, error)
	DeleteExpenseCategory(id, uid string) error
	FindOrCreateExpenseCategory(uid string, name string) (model.ExpenseCategory, error)
	HardDeleteAllUserExpenseCategories(uid string) error
	transaction.TransactionHandler
}

type ExpenseLocationRepository interface {
	FindExpenseLocations(uid string) ([]model.ExpenseLocation, error)
	FindExpenseLocation(id string, uid string) (model.ExpenseLocation, error)
	FindOrCreateExpenseLocation(uid string, name string) (model.ExpenseLocation, error)
	HardDeleteAllUserExpenseLocations(uid string) error
	transaction.TransactionHandler
}

type ExpenseScheduleRepository interface {
	FindExpenseSchedules(uid string) ([]model.ExpenseSchedule, error)
	FindExpenseSchedule(id, uid string) (model.ExpenseSchedule, error)
	UpdateExpenseSchedule(uid string, schedule model.ExpenseSchedule) (model.ExpenseSchedule, error)
	DeleteExpenseSchedule(id, uid string) error
	CreateExpenseSchedule(uid string, expenseSchedule model.ExpenseSchedule) (model.ExpenseSchedule, error)
	FindScheduledDueExpenseQueues() ([]model.ScheduledExpenseQueue, error)
	DeleteScheduledExpenseQueues(queues []model.ScheduledExpenseQueue) error
	EnqueueExpenseSchedule() error
	transaction.TransactionHandler
}

type IncomeScheduleRepository interface {
	FindIncomeSchedules(uid string) ([]model.IncomeSchedule, error)
	FindIncomeSchedule(id, uid string) (model.IncomeSchedule, error)
	UpdateIncomeSchedule(uid string, schedule model.IncomeSchedule) (model.IncomeSchedule, error)
	DeleteIncomeSchedule(id, uid string) error
	CreateIncomeSchedule(uid string, incomeSchedule model.IncomeSchedule) (model.IncomeSchedule, error)
	FindScheduledDueIncomeQueues() ([]model.ScheduledIncomeQueue, error)
	DeleteScheduledIncomeQueues(queues []model.ScheduledIncomeQueue) error
	EnqueueIncomeSchedule() error
	transaction.TransactionHandler
}

type ExpenseRepository interface {
	FindExpense(id, uid string) (model.Expense, error)
	FindExpenses(uid string, start, end *time.Time) ([]model.Expense, error)
	CreateExpense(uid string, expense model.Expense) (model.Expense, error)
	UpdateExpense(uid string, expense model.Expense) (model.Expense, error)
	DeleteExpense(id, uid string) error
	HardDeleteAllUserExpenses(uid string) error
	FindColumnChartExpenseData(uid string) ([]repositories.ColumnChartData, error)
	FindPieChartLocationData(uid string, start, end *time.Time) ([]repositories.PieChartData, error)
	FindPieChartCategoryData(uid string, start, end *time.Time) ([]repositories.PieChartData, error)
	CreateExpensesFromScheduledQueue(queues []model.ScheduledExpenseQueue) error
	transaction.TransactionHandler
}

type IncomeRepository interface {
	FindIncome(id, uid string) (model.Income, error)
	FindIncomes(uid string, start, end *time.Time) ([]model.Income, error)
	CreateIncome(uid string, income model.Income) (model.Income, error)
	UpdateIncome(uid string, income model.Income) (model.Income, error)
	HardDeleteAllUserIncomes(uid string) error
	FindColumnChartIncomeData(uid string) ([]repositories.ColumnChartData, error)
	CreateIncomesFromScheduledQueue(queues []model.ScheduledIncomeQueue) error
	transaction.TransactionHandler
}

type IncomeTypeRepository interface {
	FindIncomeTypes(uid string) ([]model.IncomeType, error)
	FindOrCreateIncomeType(uid string, name string) (model.IncomeType, error)
}

type TransactionMonthsRepository interface {
	FindTransactionMonths(uid string) ([]string, error)
}

type UserRepository interface {
	FindOrCreateUser(uid string) (model.User, error)
	FindAllUIDs() ([]string, error)
	DeleteUsers(uids []string) error
	transaction.TransactionHandler
}
