package services

import (
	"github.com/pkg/errors"
	"github.com/wakamenod/suito/api/services/repositories"
)

type (
	TransactionSchedule struct {
		ID     string `json:"id"`
		Title  string `json:"title"`
		Amount int    `json:"amount"`
	} // @Name TransactionSchedule
)

func (s *SuitoJobService) CreateTransactionsService() error {
	err := s.Transaction(func(txRepo repositories.Repository) error {
		{ // expense
			queues, err := txRepo.FindScheduledDueExpenseQueues()
			if err != nil {
				return err
			}
			if len(queues) > 0 {
				if err := txRepo.CreateExpensesFromScheduledQueue(queues); err != nil {
					return err
				}
				if err := txRepo.DeleteScheduledExpenseQueues(queues); err != nil {
					return err
				}
			}
		}
		{ // income
			queues, err := txRepo.FindScheduledDueIncomeQueues()
			if err != nil {
				return err
			}
			if len(queues) > 0 {
				if err := txRepo.CreateIncomesFromScheduledQueue(queues); err != nil {
					return err
				}
				if err := txRepo.DeleteScheduledIncomeQueues(queues); err != nil {
					return err
				}
			}
		}
		return nil
	})
	if err != nil {
		return errors.Wrap(err, "err CreateTransactionsService")
	}

	return nil
}

func (s *SuitoService) ListTransactionSchedulesService(uid string) ([]TransactionSchedule, []TransactionSchedule, error) {
	expenses, err := s.repo.FindExpenseSchedules(uid)
	if err != nil {
		return nil, nil, err
	}
	incomes, err := s.repo.FindIncomeSchedules(uid)
	if err != nil {
		return nil, nil, err
	}

	resExpenses := make([]TransactionSchedule, len(expenses))
	for i, ex := range expenses {
		resExpenses[i] = TransactionSchedule{
			ID:     ex.ID,
			Title:  ex.Title,
			Amount: ex.Amount,
		}
	}

	resIncomes := make([]TransactionSchedule, len(incomes))
	for i, in := range incomes {
		resIncomes[i] = TransactionSchedule{
			ID:     in.ID,
			Title:  in.IncomeType.Name,
			Amount: in.Amount,
		}
	}

	return resExpenses, resIncomes, nil
}

func (s *SuitoJobService) EnqueueTransactionSchedulesService() error {
	err := s.Transaction(func(txRepo repositories.Repository) error {
		if err := txRepo.EnqueueExpenseSchedule(); err != nil {
			return err
		}
		if err := txRepo.EnqueueIncomeSchedule(); err != nil {
			return err
		}
		return nil
	})
	if err != nil {
		return errors.Wrap(err, "err EnqueueTransactionSchedulesService")
	}

	return nil
}
