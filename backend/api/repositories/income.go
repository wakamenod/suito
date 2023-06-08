package repositories

import (
	"time"

	"github.com/pkg/errors"
	"github.com/rs/xid"
	"github.com/wakamenod/suito/model"
)

func (r *SuitoRepository) FindIncomes(uid string, start, end *time.Time) ([]model.Income, error) {
	var incomes []model.Income

	if err := r.db.Where("uid = ? AND local_date BETWEEN ? AND ?", uid, start, end).
		Order("local_date desc").
		Find(&incomes).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find incomes")
	}

	return incomes, nil
}

func (r *SuitoRepository) CreateIncome(uid string, income model.Income) (model.Income, error) {
	income.ID = xid.New().String()
	income.UID = uid

	if err := r.db.Create(&income).Error; err != nil {
		return income, errors.Wrap(err, "failed to create incomes")
	}

	return income, nil
}
