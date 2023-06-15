package repositories

import (
	"time"

	"github.com/pkg/errors"
	"github.com/rs/xid"
	"github.com/wakamenod/suito/model"
)

func (r *SuitoRepository) FindExpenses(uid string, start, end *time.Time) ([]model.Expense, error) {
	var expenses []model.Expense

	if err := r.db.Where("uid = ? AND local_date >= ? AND local_date < ?", uid, start, end).
		Order("local_date desc").
		Find(&expenses).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find expenses")
	}

	return expenses, nil
}

func (r *SuitoRepository) FindExpense(id, uid string) (model.Expense, error) {
	var expense model.Expense

	if err := r.db.Where("id = ? AND uid = ?", id, uid).
		First(&expense).Error; err != nil {
		return expense, errors.Wrap(err, "failed to find expense")
	}

	return expense, nil
}

func (r *SuitoRepository) CreateExpense(uid string, expense model.Expense) (model.Expense, error) {
	expense.ID = xid.New().String()
	expense.UID = uid

	if err := r.db.Create(&expense).Error; err != nil {
		return expense, errors.Wrap(err, "failed to create expenses")
	}

	return expense, nil
}

func (r *SuitoRepository) UpdateExpense(uid string, expense model.Expense) (model.Expense, error) {
	if err := r.db.Where("id = ? AND uid = ?", expense.ID, uid).Updates(expense).Error; err != nil {
		return expense, errors.Wrap(err, "failed to update expenses")
	}
	return expense, nil
}

func (r *SuitoRepository) DeleteExpense(id string, uid string) error {
	if err := r.db.Where("id = ? AND uid = ?", id, uid).Delete(&model.Expense{}).Error; err != nil {
		return errors.Wrap(err, "failed to delete expenses")
	}
	return nil
}

func (r *SuitoRepository) HardDeleteAllUserExpenses(uid string) error {
	if err := r.db.Unscoped().Where("uid = ?", uid).Delete(&model.Expense{}).Error; err != nil {
		return errors.Wrap(err, "failed to hard delete expenses")
	}
	return nil
}
