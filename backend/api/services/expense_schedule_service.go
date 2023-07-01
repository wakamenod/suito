package services

import (
	"github.com/wakamenod/suito/model"
)

func (s *SuitoExpenseScheduleService) FindExpenseScheduleService(id, uid string) (model.ExpenseSchedule, error) {
	res, err := s.expenseScheduleRepo.FindExpenseSchedule(id, uid)
	if err != nil {
		return res, err
	}
	return res, nil
}

func (s *SuitoExpenseScheduleService) UpdateExpenseScheduleService(uid string, expenseSchedule model.ExpenseSchedule) (model.ExpenseSchedule, error) {
	expenseSchedule, err := s.expenseScheduleRepo.UpdateExpenseSchedule(uid, expenseSchedule)
	if err != nil {
		return expenseSchedule, err
	}
	return expenseSchedule, nil
}

func (s *SuitoExpenseScheduleService) DeleteExpenseScheduleService(id, uid string) error {
	err := s.expenseScheduleRepo.DeleteExpenseSchedule(id, uid)
	if err != nil {
		return err
	}
	return nil
}

func (s *SuitoExpenseScheduleService) CreateExpenseScheduleService(uid string, expenseSchedule model.ExpenseSchedule) (model.ExpenseSchedule, error) {
	var res model.ExpenseSchedule

	err := s.Transaction(func() error {
		expenseSchedule, err := s.expenseScheduleRepo.CreateExpenseSchedule(uid, expenseSchedule)
		if err != nil {
			return err
		}
		res = expenseSchedule

		if err := s.expenseScheduleRepo.EnqueueExpenseSchedule(); err != nil {
			return err
		}

		return nil
	}, s.expenseScheduleRepo)
	if err != nil {
		return res, err
	}

	return res, nil
}
