package services

import (
	"strings"

	"github.com/wakamenod/suito/api/services/repositories"
	"github.com/wakamenod/suito/model"
)

func (s *SuitoService) FindExpenseService(id, uid string) (model.Expense, string, string, error) {
	expense, err := s.repo.FindExpense(id, uid)
	if err != nil {
		return expense, "", "", err
	}

	var categoryName, locationName string
	if expense.ExpenseCategoryID != "" {
		category, err := s.repo.FindExpenseCategory(expense.ExpenseCategoryID, uid)
		if err != nil {
			return expense, "", "", err
		}
		categoryName = category.Name
	}
	if expense.ExpenseLocationID != "" {
		location, err := s.repo.FindExpenseLocation(expense.ExpenseLocationID, uid)
		if err != nil {
			return expense, "", "", err
		}
		locationName = location.Name
	}

	return expense, categoryName, locationName, nil
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
	var res model.Expense

	err := s.Transaction(func(txRepo repositories.Repository) error {
		if categoryName != "" {
			category, err := txRepo.FindOrCreateExpenseCategory(uid, strings.TrimSpace(categoryName))
			if err != nil {
				return err
			}
			expense.ExpenseCategoryID = category.ID
		}
		if locationName != "" {
			location, err := txRepo.FindOrCreateExpenseLocation(uid, strings.TrimSpace(locationName))
			if err != nil {
				return err
			}
			expense.ExpenseLocationID = location.ID
		}

		expense, err := txRepo.CreateExpense(uid, expense)
		if err != nil {
			return err
		}
		res = expense
		return nil
	})
	if err != nil {
		return res, err
	}

	return res, nil
}

func (s *SuitoService) UpdateExpenseService(uid string, expense model.Expense, categoryName, locationName string) (model.Expense, error) {
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

	expense, err := s.repo.UpdateExpense(uid, expense)
	if err != nil {
		return expense, err
	}
	return expense, nil
}

func (s *SuitoService) DeleteExpenseService(id, uid string) error {
	err := s.repo.DeleteExpense(id, uid)
	if err != nil {
		return err
	}
	return nil
}
