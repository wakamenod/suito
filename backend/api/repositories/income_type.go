package repositories

import (
	"github.com/pkg/errors"
	"github.com/rs/xid"
	"github.com/wakamenod/suito/model"
	"gorm.io/gorm"
)

func (r *SuitoIncomeTypeRepository) FindIncomeTypes(uid string) ([]model.IncomeType, error) {
	var res []model.IncomeType

	if err := r.db.Where("uid = ?", uid).
		Order("id desc").
		Find(&res).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find income types")
	}

	return res, nil
}

func (r *SuitoIncomeTypeRepository) FindOrCreateIncomeType(uid string, name string) (model.IncomeType, error) {
	var res model.IncomeType

	err := r.db.Transaction(func(tx *gorm.DB) error {
		if err := tx.Where(model.IncomeType{Name: name, UID: uid}).
			Attrs(model.IncomeType{ID: xid.New().String()}).
			FirstOrCreate(&res).Error; err != nil {
			return errors.Wrap(err, "failed to find or create income type")
		}
		return nil
	})
	if err != nil {
		if !errors.Is(err, gorm.ErrDuplicatedKey) {
			return res, err
		}
		var fallbackRes model.IncomeType
		if err := r.db.Where(model.IncomeType{Name: name, UID: uid}).
			First(&fallbackRes).Error; err != nil {
			return res, errors.Wrap(err, "failed to find income type")
		}
		return fallbackRes, nil
	}

	return res, nil
}
