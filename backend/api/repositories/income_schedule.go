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
