package services

import "github.com/wakamenod/suito/model"

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
