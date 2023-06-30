package services

import (
	"github.com/wakamenod/suito/api/services/repositories"
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

	err := s.Transaction(func(txRepo repositories.Repository) error {
		incomeSchedule, err := txRepo.CreateIncomeSchedule(uid, incomeSchedule)
		if err != nil {
			return err
		}
		res = incomeSchedule

		if err := txRepo.EnqueueIncomeSchedule(); err != nil {
			return err
		}

		return nil
	})
	if err != nil {
		return res, err
	}

	return res, nil
}
