package services

import (
	"github.com/wakamenod/suito/model"
)

func (s *SuitoService) FindIncomeService(id, uid string) (model.Income, error) {
	income, err := s.repo.FindIncome(id, uid)
	if err != nil {
		return income, err
	}
	return income, nil
}

func (s *SuitoService) ListIncomeTypesService(uid string) ([]model.IncomeType, error) {
	incomeTypes, err := s.repo.FindIncomeTypes(uid)
	if err != nil {
		return nil, err
	}
	return incomeTypes, nil
}

func (s *SuitoService) CreateIncomeService(uid string, income model.Income) (model.Income, error) {
	income, err := s.repo.CreateIncome(uid, income)
	if err != nil {
		return income, err
	}
	return income, nil
}

func (s *SuitoService) UpdateIncomeService(uid string, income model.Income) (model.Income, error) {
	income, err := s.repo.UpdateIncome(uid, income)
	if err != nil {
		return income, err
	}
	return income, nil
}
