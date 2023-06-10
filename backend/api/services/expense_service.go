package services

import (
	"strings"

	"github.com/wakamenod/suito/model"
)

func (s *SuitoService) FindExpenseService(id, uid string) (model.Expense, error) {
	expense, err := s.repo.FindExpense(id, uid)
	if err != nil {
		return expense, err
	}
	return expense, nil
}

func (s *SuitoService) ListExpenseCategoryService(uid string) ([]model.ExpenseCategory, error) {
	categories, err := s.repo.FindExpenseCategories(uid)
	if err != nil {
		return nil, err
	}
	return categories, nil
}

func (s *SuitoService) ListExpenseLocationService(uid string) ([]model.ExpenseLocation, error) {
	locations, err := s.repo.FindExpenseLocations(uid)
	if err != nil {
		return nil, err
	}
	return locations, nil
}

func (s *SuitoService) CreateExpenseService(uid string, expense model.Expense, categoryName, locationName string) (model.Expense, error) {
	if categoryName != "" {
		category, err := s.repo.FindOrCreateExpenseCategory(uid, strings.TrimSpace(categoryName))
		if err != nil {
			return model.Expense{}, err
		}
		expense.ExpenseCategoryID = category.ID
	}
	if locationName != "" {
		location, err := s.repo.FindOrCreateExpenseLocation(uid, strings.TrimSpace(locationName))
		if err != nil {
			return model.Expense{}, err
		}
		expense.ExpenseLocationID = location.ID
	}

	expense, err := s.repo.CreateExpense(uid, expense)
	if err != nil {
		return expense, err
	}
	return expense, nil
}
