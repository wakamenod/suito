package services

import (
	"strings"

	"github.com/wakamenod/suito/api/repositories"
	"github.com/wakamenod/suito/model"
)

func (s *SuitoService) FindExpenseScheduleService(id, uid string) (model.ExpenseSchedule, error) {
	res, err := s.repo.FindExpenseSchedule(id, uid)
	if err != nil {
		return res, err
	}
	return res, nil
}

// TODO 即時のキューイング
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

func (s *SuitoService) DeleteExpenseScheduleService(id, uid string) error {
	err := s.repo.DeleteExpenseSchedule(id, uid)
	if err != nil {
		return err
	}
	return nil
}

func (s *SuitoService) CreateExpenseScheduleService(uid string, expenseSchedule model.ExpenseSchedule) (model.ExpenseSchedule, error) {
	var res model.ExpenseSchedule

	err := s.repo.Transaction(func(txRepo *repositories.SuitoRepository) error {
		categoryName := expenseSchedule.ExpenseCategory.Name
		if categoryName != "" {
			category, err := s.repo.FindOrCreateExpenseCategory(uid, strings.TrimSpace(categoryName))
			if err != nil {
				return err
			}
			expenseSchedule.ExpenseCategory = category
			expenseSchedule.ExpenseCategoryID = category.ID
		}
		locationName := expenseSchedule.ExpenseLocation.Name
		if locationName != "" {
			location, err := s.repo.FindOrCreateExpenseLocation(uid, strings.TrimSpace(locationName))
			if err != nil {
				return err
			}
			expenseSchedule.ExpenseLocation = location
			expenseSchedule.ExpenseLocationID = location.ID
		}

		expenseSchedule, err := s.repo.CreateExpenseSchedule(uid, expenseSchedule)
		if err != nil {
			return err
		}
		res = expenseSchedule
		return nil
	})
	if err != nil {
		return res, err
	}

	return res, nil
}
