package repositories

import (
	"github.com/pkg/errors"
	"github.com/rs/xid"
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
	if err := r.db.Model(&model.IncomeSchedule{}).
		Where("id = ? AND uid = ?", incomeSchedule.ID, uid).
		Updates(map[string]any{
			"amount":         incomeSchedule.Amount,
			"memo":           incomeSchedule.Memo,
			"income_type_id": incomeSchedule.IncomeTypeID,
		}).Error; err != nil {
		return incomeSchedule, errors.Wrap(err, "failed to update incomeSchedule")
	}
	return incomeSchedule, nil
}

func (r *SuitoRepository) DeleteIncomeSchedule(id string, uid string) error {
	if err := r.db.Where("id = ? AND uid = ?", id, uid).Delete(&model.IncomeSchedule{}).Error; err != nil {
		return errors.Wrap(err, "failed to delete income schedule")
	}
	return nil
}

func (r *SuitoRepository) CreateIncomeSchedule(uid string, incomeSchedule model.IncomeSchedule) (model.IncomeSchedule, error) {
	incomeSchedule.ID = xid.New().String()
	incomeSchedule.UID = uid

	if err := r.db.Create(&incomeSchedule).Error; err != nil {
		return incomeSchedule, errors.Wrap(err, "failed to create income schedule")
	}

	return incomeSchedule, nil
}
