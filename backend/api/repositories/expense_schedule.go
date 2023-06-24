package repositories

import (
	"github.com/pkg/errors"
	"github.com/rs/xid"
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

func (r *SuitoRepository) UpdateExpenseSchedule(uid string, expenseSchedule model.ExpenseSchedule) (model.ExpenseSchedule, error) {
	if err := r.db.Where("uid = ?", uid).Updates(&expenseSchedule).Error; err != nil {
		return expenseSchedule, errors.Wrap(err, "failed to update expense schedule")
	}
	return expenseSchedule, nil
}

func (r *SuitoRepository) DeleteExpenseSchedule(id string, uid string) error {
	if err := r.db.Where("id = ? AND uid = ?", id, uid).Delete(&model.ExpenseSchedule{}).Error; err != nil {
		return errors.Wrap(err, "failed to delete expense schedule")
	}
	return nil
}

func (r *SuitoRepository) CreateExpenseSchedule(uid string, expenseSchedule model.ExpenseSchedule) (model.ExpenseSchedule, error) {
	expenseSchedule.ID = xid.New().String()
	expenseSchedule.UID = uid

	if err := r.db.Create(&expenseSchedule).Error; err != nil {
		return expenseSchedule, errors.Wrap(err, "failed to create expense schedule")
	}

	return expenseSchedule, nil
}
