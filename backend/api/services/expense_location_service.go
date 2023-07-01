package services

import "github.com/wakamenod/suito/model"

func (s *SuitoExpenseLocationService) CreateExpenseLocationService(uid string, location model.ExpenseLocation) (model.ExpenseLocation, error) {
	location, err := s.expenseLocationRepo.CreateExpenseLocation(uid, location)
	if err != nil {
		return location, err
	}
	return location, nil
}

func (s *SuitoExpenseLocationService) ListExpenseLocationService(uid string) ([]model.ExpenseLocation, error) {
	locations, err := s.expenseLocationRepo.FindExpenseLocations(uid)
	if err != nil {
		return nil, err
	}
	return locations, nil
}
