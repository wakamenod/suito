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
