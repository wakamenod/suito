package repositories

import (
	"time"

	"github.com/pkg/errors"
	"github.com/wakamenod/suito/model"
)

func (r *SuitoRepository) FindExpenses(uid string, start, end *time.Time) ([]model.Expense, error) {
	var expenses []model.Expense

	if err := r.db.Where("uid = ? AND local_date BETWEEN ? AND ?", uid, start, end).
		Order("local_date desc").
		Find(&expenses).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find expenses")
	}

	return expenses, nil
}
