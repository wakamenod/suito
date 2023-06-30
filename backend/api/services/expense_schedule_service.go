package services

import (
	"github.com/wakamenod/suito/api/services/repositories"
	"github.com/wakamenod/suito/model"
)

func (s *SuitoService) FindExpenseScheduleService(id, uid string) (model.ExpenseSchedule, error) {
	res, err := s.repo.FindExpenseSchedule(id, uid)
	if err != nil {
		return res, err
	}
	return res, nil
}

func (s *SuitoService) UpdateExpenseScheduleService(uid string, expenseSchedule model.ExpenseSchedule) (model.ExpenseSchedule, error) {
	expenseSchedule, err := s.repo.UpdateExpenseSchedule(uid, expenseSchedule)
	if err != nil {
		return expenseSchedule, err
	}
	return expenseSchedule, nil
}

func (s *SuitoService) DeleteExpenseScheduleService(id, uid string) error {
	err := s.repo.DeleteExpenseSchedule(id, uid)
	if err != nil {
		return err
	}
	return nil
}

func (s *SuitoService) CreateExpenseScheduleService(uid string, expenseSchedule model.ExpenseSchedule) (model.ExpenseSchedule, error) {
	var res model.ExpenseSchedule

	err := s.Transaction(func(txRepo repositories.Repository) error {
		expenseSchedule, err := txRepo.CreateExpenseSchedule(uid, expenseSchedule)
		if err != nil {
			return err
		}
		res = expenseSchedule

		if err := txRepo.EnqueueExpenseSchedule(); err != nil {
			return err
		}

		return nil
	})
	if err != nil {
		return res, err
	}

	return res, nil
}
