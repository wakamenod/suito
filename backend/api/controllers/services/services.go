package services

import (
	"time"

	"github.com/wakamenod/suito/model"
)

type TransactionType int

const (
	TransactionTypeExpense TransactionType = 1
	TransactionTypeIncome  TransactionType = 2
)

type (
	// FIXME enumsが機能していない
	// 1) openapiのver2 -> ver3に変換時にenumの情報が消える
	// 2) ver2にのままenumの情報を残した場合にもFlutterのモデルにEnumが出ない
	Transaction struct {
		ID        string          `json:"id"`
		Title     string          `json:"title"`
		LocalDate time.Time       `json:"localDate"`
		Amount    int             `json:"amount"`
		Type      TransactionType `json:"type" enums:"1,2"`
	} // @Name Transaction
)

type TransactionsService interface {
	ListTransactionsService(uid string, start, end *time.Time) ([]Transaction, error)
	TransactionMonthsService(uid string) ([]string, error)
}

type ExpenseService interface {
	ListExpenseCategoryService(uid string) ([]model.ExpenseCategory, error)
	ListExpenseLocationService(uid string) ([]model.ExpenseLocation, error)
	CreateExpenseService(uid string, expense model.Expense) (model.Expense, error)
	FindExpenseService(id, uid string) (model.Expense, error)
}

type IncomeService interface {
	CreateIncomeService(uid string, income model.Income) (model.Income, error)
}
