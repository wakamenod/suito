package services

import (
	"sort"
	"time"

	"github.com/wakamenod/suito/api/controllers/services"
)

func (s *SuitoService) ListTransactionsService(uid string, start, end *time.Time) ([]services.Transaction, error) {
	expenses, err := s.repo.FindExpenses(uid, start, end)
	if err != nil {
		return nil, err
	}
	incomes, err := s.repo.FindIncomes(uid, start, end)
	if err != nil {
		return nil, err
	}
	transactions := make([]services.Transaction, len(expenses)+len(incomes))
	for i, ex := range expenses {
		transactions[i] = services.Transaction{
			ID:        ex.ID,
			Title:     ex.Title,
			Amount:    ex.Amount,
			LocalDate: ex.LocalDate,
			Type:      services.TransactionTypeExpense,
		}
	}
	for i, in := range incomes {
		transactions[len(expenses)+i] = services.Transaction{
			ID:        in.ID,
			Title:     in.IncomeType.Name,
			Amount:    in.Amount,
			LocalDate: in.LocalDate,
			Type:      services.TransactionTypeIncome,
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
