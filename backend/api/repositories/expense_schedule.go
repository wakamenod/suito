package repositories

import (
	"github.com/pkg/errors"
	"github.com/wakamenod/suito/model"
)

func (r *SuitoRepository) FindExpenseSchedules(uid string) ([]model.ExpenseSchedule, error) {
	var res []model.ExpenseSchedule

	if err := r.db.Where("uid = ?", uid).
		Order("id").
		Find(&res).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find expense schedules")
	}

	return res, nil
}

func (r *SuitoRepository) FindExpenseSchedule(id, uid string) (model.ExpenseSchedule, error) {
	var res model.ExpenseSchedule

	if err := r.db.
		Preload("ExpenseCategory").
		Preload("ExpenseLocation").
		Where("id = ? AND uid = ?", id, uid).
		First(&res).Error; err != nil {
		return res, errors.Wrap(err, "failed to find expense schedule")
	}

	return res, nil
}
