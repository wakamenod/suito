package repositories

import (
	"github.com/pkg/errors"
	"github.com/wakamenod/suito/model"
)

func (r *SuitoRepository) FindIncomeSchedules(uid string) ([]model.IncomeSchedule, error) {
	var res []model.IncomeSchedule

	if err := r.db.Preload("IncomeType").Where("uid = ?", uid).
		Order("id").
		Find(&res).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find income schedules")
	}

	return res, nil
}

func (r *SuitoRepository) FindIncomeSchedule(id, uid string) (model.IncomeSchedule, error) {
	var res model.IncomeSchedule

	if err := r.db.Preload("IncomeType").Where("id = ? AND uid = ?", id, uid).
		First(&res).Error; err != nil {
		return res, errors.Wrap(err, "failed to income income schedule")
	}

	return res, nil
}

func (r *SuitoRepository) UpdateIncomeSchedule(uid string, incomeSchedule model.IncomeSchedule) (model.IncomeSchedule, error) {
	if err := r.db.Where("uid = ?", uid).Updates(&incomeSchedule).Error; err != nil {
		return incomeSchedule, errors.Wrap(err, "failed to update incomeSchedule")
	}
	return incomeSchedule, nil
}
