package services

import (
	"github.com/wakamenod/suito/model"
)

func (s *SuitoExpenseService) FindExpenseService(id, uid string) (model.Expense, error) {
	expense, err := s.expenseRepo.FindExpense(id, uid)
	if err != nil {
		return expense, err
	}

	return expense, nil
}

func (s *SuitoExpenseService) CreateExpenseService(uid string, expense model.Expense) (model.Expense, error) {
	expense, err := s.expenseRepo.CreateExpense(uid, expense)
	if err != nil {
		return expense, err
	}
	return expense, nil
}

func (s *SuitoExpenseService) UpdateExpenseService(uid string, expense model.Expense) (model.Expense, error) {
	expense, err := s.expenseRepo.UpdateExpense(uid, expense)
	if err != nil {
		return expense, err
	}
	return expense, nil
}

func (s *SuitoExpenseService) DeleteExpenseService(id, uid string) error {
	err := s.expenseRepo.DeleteExpense(id, uid)
	if err != nil {
		return err
	}
	return nil
}
