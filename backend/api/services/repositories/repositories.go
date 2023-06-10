package repositories

import (
	"time"

	"github.com/wakamenod/suito/model"
)

type Repository interface {
	FindExpense(id, uid string) (model.Expense, error)
	FindExpenses(uid string, start, end *time.Time) ([]model.Expense, error)
	FindIncome(id, uid string) (model.Income, error)
	FindIncomes(uid string, start, end *time.Time) ([]model.Income, error)
	FindTransactionMonths(uid string) ([]string, error)
	FindExpenseCategories(uid string) ([]model.ExpenseCategory, error)
	FindExpenseLocations(uid string) ([]model.ExpenseLocation, error)
	CreateExpense(uid string, expense model.Expense) (model.Expense, error)
	CreateIncome(uid string, income model.Income) (model.Income, error)
	FindOrCreateExpenseCategory(uid string, name string) (model.ExpenseCategory, error)
	FindOrCreateExpenseLocation(uid string, name string) (model.ExpenseLocation, error)
}
