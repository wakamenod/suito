package services

import "github.com/wakamenod/suito/model"

func (s *SuitoExpenseCategoryService) CreateExpenseCategoryService(uid string, category model.ExpenseCategory) (model.ExpenseCategory, error) {
	category, err := s.expenseCategoryRepo.CreateExpenseCategory(uid, category)
	if err != nil {
		return category, err
	}
	return category, nil
}

func (s *SuitoExpenseCategoryService) UpdateExpenseCategoryService(uid string, category model.ExpenseCategory) (model.ExpenseCategory, error) {
	category, err := s.expenseCategoryRepo.UpdateExpenseCategory(uid, category)
	if err != nil {
		return category, err
	}
	return category, nil
}

func (s *SuitoExpenseCategoryService) DeleteExpenseCategoryService(id, uid string) error {
	if err := s.expenseCategoryRepo.DeleteExpenseCategory(id, uid); err != nil {
		return err
	}
	return nil
}

func (s *SuitoExpenseCategoryService) ListExpenseCategoryService(uid string) ([]model.ExpenseCategory, error) {
	categories, err := s.expenseCategoryRepo.FindExpenseCategories(uid)
	if err != nil {
		return nil, err
	}
	return categories, nil
}
