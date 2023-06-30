package services

import (
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

func (s *SuitoService) CreateExpenseService(uid string, expense model.Expense) (model.Expense, error) {
	expense, err := s.repo.CreateExpense(uid, expense)
	if err != nil {
		return expense, err
	}
	return expense, nil
}

func (s *SuitoService) UpdateExpenseService(uid string, expense model.Expense) (model.Expense, error) {
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
