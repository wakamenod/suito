package services

import (
	"strings"

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
	if expenseSchedule.ExpenseCategory.Name != "" {
		category, err := s.repo.FindOrCreateExpenseCategory(uid, strings.TrimSpace(expenseSchedule.ExpenseCategory.Name))
		if err != nil {
			return model.ExpenseSchedule{}, err
		}
		expenseSchedule.ExpenseCategory = category
		expenseSchedule.ExpenseCategoryID = category.ID
	}
	if expenseSchedule.ExpenseLocation.Name != "" {
		location, err := s.repo.FindOrCreateExpenseLocation(uid, strings.TrimSpace(expenseSchedule.ExpenseLocation.Name))
		if err != nil {
			return model.ExpenseSchedule{}, err
		}
		expenseSchedule.ExpenseLocation = location
		expenseSchedule.ExpenseLocationID = location.ID
	}

	expenseSchedule, err := s.repo.UpdateExpenseSchedule(uid, expenseSchedule)
	if err != nil {
		return expenseSchedule, err
	}
	return expenseSchedule, nil
}
