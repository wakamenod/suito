package services

import (
	"strings"

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
