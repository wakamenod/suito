package services

import (
	"github.com/wakamenod/suito/model"
)

func (s *SuitoIncomeScheduleService) FindIncomeScheduleService(id, uid string) (model.IncomeSchedule, error) {
	res, err := s.incomeScheduleRepo.FindIncomeSchedule(id, uid)
	if err != nil {
		return res, err
	}
	return res, nil
}

func (s *SuitoIncomeScheduleService) UpdateIncomeScheduleService(uid string, incomeSchedule model.IncomeSchedule) (model.IncomeSchedule, error) {
	incomeSchedule, err := s.incomeScheduleRepo.UpdateIncomeSchedule(uid, incomeSchedule)
	if err != nil {
		return incomeSchedule, err
	}
	return incomeSchedule, nil
}

func (s *SuitoIncomeScheduleService) DeleteIncomeScheduleService(id, uid string) error {
	err := s.incomeScheduleRepo.DeleteIncomeSchedule(id, uid)
	if err != nil {
		return err
	}
	return nil
}

func (s *SuitoIncomeScheduleService) CreateIncomeScheduleService(uid string, incomeSchedule model.IncomeSchedule) (model.IncomeSchedule, error) {
	var res model.IncomeSchedule

	err := s.Transaction(func() error {
		incomeSchedule, err := s.incomeScheduleRepo.CreateIncomeSchedule(uid, incomeSchedule)
		if err != nil {
			return err
		}
		res = incomeSchedule

		if err := s.incomeScheduleRepo.EnqueueIncomeSchedule(); err != nil {
			return err
		}

		return nil
	}, s.incomeScheduleRepo)
	if err != nil {
		return res, err
	}

	return res, nil
}
