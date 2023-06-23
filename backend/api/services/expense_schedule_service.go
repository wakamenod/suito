package services

import "github.com/wakamenod/suito/model"

func (s *SuitoService) FindExpenseScheduleService(id, uid string) (model.ExpenseSchedule, error) {
	res, err := s.repo.FindExpenseSchedule(id, uid)
	if err != nil {
		return res, err
	}
	return res, nil
}
