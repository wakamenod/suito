package services

import (
	"github.com/pkg/errors"
	"github.com/wakamenod/suito/api/repositories"
)

func (s *SuitoJobService) CreateTransactionsService() error {
	err := s.repo.Transaction(func(txRepo *repositories.SuitoRepository) error {
		{ // expense
			queues, err := txRepo.FindScheduledExpenseQueues()
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
			queues, err := txRepo.FindScheduledIncomeQueues()
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
