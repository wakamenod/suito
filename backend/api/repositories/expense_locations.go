package repositories

import (
	"github.com/pkg/errors"
	"github.com/rs/xid"
	"github.com/wakamenod/suito/model"
)

func (r *SuitoRepository) FindExpenseLocations(uid string) ([]model.ExpenseLocation, error) {
	var res []model.ExpenseLocation

	if err := r.db.Where("uid = ?", uid).
		Order("id desc").
		Find(&res).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find expense locations")
	}

	return res, nil
}

func (r *SuitoRepository) FindExpenseLocation(id string, uid string) (model.ExpenseLocation, error) {
	var res model.ExpenseLocation

	if err := r.db.Where(model.ExpenseLocation{ID: id, UID: uid}).
		First(&res).Error; err != nil {
		return res, errors.Wrap(err, "failed to find expense location")
	}

	return res, nil
}

func (r *SuitoRepository) FindOrCreateExpenseLocation(uid string, name string) (model.ExpenseLocation, error) {
	var res model.ExpenseLocation

	if err := r.db.Where(model.ExpenseLocation{Name: name, UID: uid}).
		Attrs(model.ExpenseLocation{ID: xid.New().String()}).
		FirstOrCreate(&res).Error; err != nil {
		return res, errors.Wrap(err, "failed to find expense location")
	}

	return res, nil
}

func (r *SuitoRepository) HardDeleteAllUserExpenseLocations(uid string) error {
	if err := r.db.Unscoped().Where("uid = ?", uid).Delete(&model.ExpenseLocation{}).Error; err != nil {
		return errors.Wrap(err, "failed to hard delete expense locations")
	}
	return nil
}
