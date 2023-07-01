package services

import (
	"github.com/wakamenod/suito/model"
)

func (s *SuitoIncomeService) FindIncomeService(id, uid string) (model.Income, error) {
	income, err := s.incomeRepo.FindIncome(id, uid)
	if err != nil {
		return income, err
	}
	return income, nil
}

func (s *SuitoIncomeService) ListIncomeTypesService(uid string) ([]model.IncomeType, error) {
	incomeTypes, err := s.incomeTypeRepo.FindIncomeTypes(uid)
	if err != nil {
		return nil, err
	}
	return incomeTypes, nil
}

func (s *SuitoIncomeService) CreateIncomeService(uid string, income model.Income) (model.Income, error) {
	income, err := s.incomeRepo.CreateIncome(uid, income)
	if err != nil {
		return income, err
	}
	return income, nil
}

func (s *SuitoIncomeService) UpdateIncomeService(uid string, income model.Income) (model.Income, error) {
	income, err := s.incomeRepo.UpdateIncome(uid, income)
	if err != nil {
		return income, err
	}
	return income, nil
}
