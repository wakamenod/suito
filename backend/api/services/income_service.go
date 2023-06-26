package services

import (
	"strings"

	"github.com/wakamenod/suito/api/services/repositories"
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
	var res model.Income

	err := s.Transaction(func(txRepo repositories.Repository) error {
		if income.IncomeType.Name != "" {
			incomeType, err := txRepo.FindOrCreateIncomeType(uid, strings.TrimSpace(income.IncomeType.Name))
			if err != nil {
				return err
			}
			income.IncomeTypeID = incomeType.ID
			income.IncomeType = incomeType
		}

		income, err := txRepo.CreateIncome(uid, income)
		if err != nil {
			return err
		}
		res = income
		return nil
	})
	if err != nil {
		return res, err
	}
	return res, nil
}

func (s *SuitoService) UpdateIncomeService(uid string, income model.Income) (model.Income, error) {
	var res model.Income

	err := s.Transaction(func(txRepo repositories.Repository) error {
		if income.IncomeType.Name != "" {
			incomeType, err := txRepo.FindOrCreateIncomeType(uid, strings.TrimSpace(income.IncomeType.Name))
			if err != nil {
				return err
			}
			income.IncomeTypeID = incomeType.ID
			income.IncomeType = incomeType
		}

		income, err := txRepo.UpdateIncome(uid, income)
		if err != nil {
			return err
		}
		res = income
		return nil
	})
	if err != nil {
		return res, err
	}
	return res, nil
}
