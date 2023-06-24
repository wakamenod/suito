package services

import (
	"strings"

	"github.com/wakamenod/suito/api/repositories"
	"github.com/wakamenod/suito/model"
)

func (s *SuitoService) FindIncomeScheduleService(id, uid string) (model.IncomeSchedule, error) {
	res, err := s.repo.FindIncomeSchedule(id, uid)
	if err != nil {
		return res, err
	}
	return res, nil
}

func (s *SuitoService) UpdateIncomeScheduleService(uid string, incomeSchedule model.IncomeSchedule) (model.IncomeSchedule, error) {
	if incomeSchedule.IncomeType.Name != "" {
		incomeType, err := s.repo.FindOrCreateIncomeType(uid, strings.TrimSpace(incomeSchedule.IncomeType.Name))
		if err != nil {
			return model.IncomeSchedule{}, err
		}
		incomeSchedule.IncomeType = incomeType
		incomeSchedule.IncomeTypeID = incomeType.ID
	}

	incomeSchedule, err := s.repo.UpdateIncomeSchedule(uid, incomeSchedule)
	if err != nil {
		return incomeSchedule, err
	}
	return incomeSchedule, nil
}

func (s *SuitoService) DeleteIncomeScheduleService(id, uid string) error {
	err := s.repo.DeleteIncomeSchedule(id, uid)
	if err != nil {
		return err
	}
	return nil
}

func (s *SuitoService) CreateIncomeScheduleService(uid string, incomeSchedule model.IncomeSchedule) (model.IncomeSchedule, error) {
	var res model.IncomeSchedule

	err := s.repo.Transaction(func(txRepo *repositories.SuitoRepository) error {
		incomeType := incomeSchedule.IncomeType.Name
		if incomeType != "" {
			incomeType, err := s.repo.FindOrCreateIncomeType(uid, strings.TrimSpace(incomeType))
			if err != nil {
				return err
			}
			incomeSchedule.IncomeType = incomeType
			incomeSchedule.IncomeTypeID = incomeType.ID
		}
		incomeSchedule, err := s.repo.CreateIncomeSchedule(uid, incomeSchedule)
		if err != nil {
			return err
		}
		res = incomeSchedule
		return nil
	})
	if err != nil {
		return res, err
	}

	return res, nil
}
