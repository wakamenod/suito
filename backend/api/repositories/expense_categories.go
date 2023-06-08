package repositories

import (
	"github.com/pkg/errors"
	"github.com/wakamenod/suito/model"
)

func (r *SuitoRepository) FindExpenseLocations(uid string) ([]model.ExpenseLocation, error) {
	var res []model.ExpenseLocation

	if err := r.db.Where("uid = ?", uid).
		Order("created_at desc").
		Find(&res).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find expense locations")
	}

	return res, nil
}
