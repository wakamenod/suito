package repositories

import (
	"time"

	"github.com/wakamenod/suito/model"
)

type Repository interface {
	FindExpenses(uid string, start, end *time.Time) ([]model.Expense, error)
	FindIncomes(uid string, start, end *time.Time) ([]model.Income, error)
}
