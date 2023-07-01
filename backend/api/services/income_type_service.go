package services

import "github.com/wakamenod/suito/model"

func (s *SuitoIncomeTypeService) CreateIncomeTypeService(uid string, incomeType model.IncomeType) (model.IncomeType, error) {
	incomeType, err := s.incomeTypeRepo.CreateIncomeType(uid, incomeType)
	if err != nil {
		return incomeType, err
	}
	return incomeType, nil
}

func (s *SuitoIncomeTypeService) ListIncomeTypesService(uid string) ([]model.IncomeType, error) {
	incomeTypes, err := s.incomeTypeRepo.FindIncomeTypes(uid)
	if err != nil {
		return nil, err
	}
	return incomeTypes, nil
}

func (s *SuitoIncomeTypeService) UpdateIncomeTypeService(uid string, incomeType model.IncomeType) (model.IncomeType, error) {
	incomeType, err := s.incomeTypeRepo.UpdateIncomeType(uid, incomeType)
	if err != nil {
		return incomeType, err
	}
	return incomeType, nil
}
