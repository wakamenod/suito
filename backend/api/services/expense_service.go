package services

import (
	"github.com/wakamenod/suito/model"
)

func (s *SuitoExpenseService) FindExpenseService(id, uid string) (model.Expense, string, string, error) {
	expense, err := s.expenseRepo.FindExpense(id, uid)
	if err != nil {
		return expense, "", "", err
	}

	var categoryName, locationName string
	if expense.ExpenseCategoryID != "" {
		category, err := s.expenseCategoryRepo.FindExpenseCategory(expense.ExpenseCategoryID, uid)
		if err != nil {
			return expense, "", "", err
		}
		categoryName = category.Name
	}
	if expense.ExpenseLocationID != "" {
		location, err := s.expenseLocationRepo.FindExpenseLocation(expense.ExpenseLocationID, uid)
		if err != nil {
			return expense, "", "", err
		}
		locationName = location.Name
	}

	return expense, categoryName, locationName, nil
}

func (s *SuitoExpenseService) ListExpenseCategoryService(uid string) ([]model.ExpenseCategory, error) {
	categories, err := s.expenseCategoryRepo.FindExpenseCategories(uid)
	if err != nil {
		return nil, err
	}
	return categories, nil
}

func (s *SuitoExpenseService) ListExpenseLocationService(uid string) ([]model.ExpenseLocation, error) {
	locations, err := s.expenseLocationRepo.FindExpenseLocations(uid)
	if err != nil {
		return nil, err
	}
	return locations, nil
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
