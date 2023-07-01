package repositories

import (
	"github.com/pkg/errors"
	"github.com/rs/xid"
	"github.com/wakamenod/suito/model"
	"gorm.io/gorm"
)

func (r *SuitoExpenseLocationRepository) FindExpenseLocations(uid string) ([]model.ExpenseLocation, error) {
	var res []model.ExpenseLocation

	if err := r.db.Where("uid = ?", uid).
		Order("id desc").
		Find(&res).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find expense locations")
	}

	return res, nil
}

func (r *SuitoExpenseLocationRepository) FindExpenseLocation(id string, uid string) (model.ExpenseLocation, error) {
	var res model.ExpenseLocation

	if err := r.db.Where(model.ExpenseLocation{ID: id, UID: uid}).
		First(&res).Error; err != nil {
		return res, errors.Wrap(err, "failed to find expense location")
	}

	return res, nil
}

func (r *SuitoExpenseLocationRepository) CreateExpenseLocation(uid string, location model.ExpenseLocation) (model.ExpenseLocation, error) {
	location.ID = xid.New().String()
	location.UID = uid

	if err := r.db.Create(&location).Error; err != nil {
		return location, errors.Wrap(err, "failed to create expense location")
	}

	return location, nil
}

func (r *SuitoExpenseLocationRepository) FindOrCreateExpenseLocation(uid string, name string) (model.ExpenseLocation, error) {
	var res model.ExpenseLocation

	err := r.db.Transaction(func(tx *gorm.DB) error {
		if err := tx.Where(model.ExpenseLocation{Name: name, UID: uid}).
			Attrs(model.ExpenseLocation{ID: xid.New().String()}).
			FirstOrCreate(&res).Error; err != nil {
			return errors.Wrap(err, "failed to find or create expense location")
		}
		return nil
	})
	if err != nil {
		if !errors.Is(err, gorm.ErrDuplicatedKey) {
			return res, err
		}
		var fallbackRes model.ExpenseLocation
		if err := r.db.Where(model.ExpenseLocation{Name: name, UID: uid}).
			First(&fallbackRes).Error; err != nil {
			return res, errors.Wrap(err, "failed to find expense location")
		}
		return fallbackRes, nil
	}

	return res, nil
}

func (r *SuitoExpenseLocationRepository) HardDeleteAllUserExpenseLocations(uid string) error {
	if err := r.db.Unscoped().Where("uid = ?", uid).Delete(&model.ExpenseLocation{}).Error; err != nil {
		return errors.Wrap(err, "failed to hard delete expense locations")
	}
	return nil
}
