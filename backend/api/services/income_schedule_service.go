package services

import "github.com/wakamenod/suito/model"

func (s *SuitoService) FindIncomeScheduleService(id, uid string) (model.IncomeSchedule, error) {
	res, err := s.repo.FindIncomeSchedule(id, uid)
	if err != nil {
		return res, err
	}
	return res, nil
}
