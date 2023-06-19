package services

import (
	"sort"
	"time"
)

const (
	TransactionTypeExpense TransactionType = 1
	TransactionTypeIncome  TransactionType = 2
)

type TransactionType int

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

func (s *SuitoService) ListTransactionsService(uid string, start, end *time.Time) ([]Transaction, error) {
	expenses, err := s.repo.FindExpenses(uid, start, end)
	if err != nil {
		return nil, err
	}
	incomes, err := s.repo.FindIncomes(uid, start, end)
	if err != nil {
		return nil, err
	}
	transactions := make([]Transaction, len(expenses)+len(incomes))
	for i, ex := range expenses {
		transactions[i] = Transaction{
			ID:        ex.ID,
			Title:     ex.Title,
			Amount:    ex.Amount,
			LocalDate: ex.LocalDate,
			Type:      TransactionTypeExpense,
		}
	}
	for i, in := range incomes {
		transactions[len(expenses)+i] = Transaction{
			ID:        in.ID,
			Title:     in.IncomeType.Name,
			Amount:    in.Amount,
			LocalDate: in.LocalDate,
			Type:      TransactionTypeIncome,
		}
	}

	sort.SliceStable(transactions, func(i, j int) bool {
		return transactions[i].LocalDate.After(transactions[j].LocalDate)
	})

	return transactions, nil
}

func (s *SuitoService) TransactionMonthsService(uid string) ([]string, error) {
	months, err := s.repo.FindTransactionMonths(uid)
	if err != nil {
		return nil, err
	}
	return months, nil
}
