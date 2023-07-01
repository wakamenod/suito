package services

import (
	"github.com/pkg/errors"
)

type (
	TransactionSchedule struct {
		ID     string `json:"id"`
		Title  string `json:"title"`
		Amount int    `json:"amount"`
	} // @Name TransactionSchedule
)

func (s *SuitoScheduleJobService) CreateTransactionsService() error {
	err := s.Transaction(func() error {
		{ // expense
			queues, err := s.expenseScheduleRepo.FindScheduledDueExpenseQueues()
			if err != nil {
				return err
			}
			if len(queues) > 0 {
				if err := s.expenseRepo.CreateExpensesFromScheduledQueue(queues); err != nil {
					return err
				}
				if err := s.expenseScheduleRepo.DeleteScheduledExpenseQueues(queues); err != nil {
					return err
				}
			}
		}
		{ // income
			queues, err := s.incomeScheduleRepo.FindScheduledDueIncomeQueues()
			if err != nil {
				return err
			}
			if len(queues) > 0 {
				if err := s.incomeRepo.CreateIncomesFromScheduledQueue(queues); err != nil {
					return err
				}
				if err := s.incomeScheduleRepo.DeleteScheduledIncomeQueues(queues); err != nil {
					return err
				}
			}
		}
		return nil
	}, s.expenseScheduleRepo, s.expenseRepo, s.incomeScheduleRepo, s.incomeRepo)
	if err != nil {
		return errors.Wrap(err, "err CreateTransactionsService")
	}

	return nil
}

func (s *SuitoScheduleJobService) EnqueueTransactionSchedulesService() error {
	err := s.Transaction(func() error {
		if err := s.expenseScheduleRepo.EnqueueExpenseSchedule(); err != nil {
			return err
		}
		if err := s.incomeScheduleRepo.EnqueueIncomeSchedule(); err != nil {
			return err
		}
		return nil
	}, s.expenseScheduleRepo, s.incomeScheduleRepo)
	if err != nil {
		return errors.Wrap(err, "err EnqueueTransactionSchedulesService")
	}

	return nil
}
