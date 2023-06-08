package repositories

import (
	"github.com/pkg/errors"
	"github.com/wakamenod/suito/model"
)

func (r *SuitoRepository) FindExpenseCategories(uid string) ([]model.ExpenseCategory, error) {
	var res []model.ExpenseCategory

	if err := r.db.Where("uid = ?", uid).
		Order("created_at desc").
		Find(&res).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find expense categories")
	}

	return res, nil
}
