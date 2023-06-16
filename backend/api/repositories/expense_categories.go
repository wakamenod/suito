package repositories

import (
	"github.com/pkg/errors"
	"github.com/rs/xid"
	"github.com/wakamenod/suito/model"
	"gorm.io/gorm"
)

func (r *SuitoRepository) FindExpenseCategories(uid string) ([]model.ExpenseCategory, error) {
	var res []model.ExpenseCategory

	if err := r.db.Where("uid = ?", uid).
		Order("id desc").
		Find(&res).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find expense categories")
	}

	return res, nil
}

func (r *SuitoRepository) FindExpenseCategory(id string, uid string) (model.ExpenseCategory, error) {
	var res model.ExpenseCategory

	if err := r.db.Where(model.ExpenseCategory{ID: id, UID: uid}).
		First(&res).Error; err != nil {
		return res, errors.Wrap(err, "failed to find expense category")
	}

	return res, nil
}

func (r *SuitoRepository) FindOrCreateExpenseCategory(uid string, name string) (model.ExpenseCategory, error) {
	var res model.ExpenseCategory

	err := r.db.Transaction(func(tx *gorm.DB) error {
		if err := tx.Where(model.ExpenseCategory{Name: name, UID: uid}).
			Attrs(model.ExpenseCategory{ID: xid.New().String()}).
			FirstOrCreate(&res).Error; err != nil {
			return errors.Wrap(err, "failed to find or create expense category")
		}
		return nil
	})
	if err != nil {
		if !errors.Is(err, gorm.ErrDuplicatedKey) {
			return res, err
		}
		var fallbackRes model.ExpenseCategory
		if err := r.db.Where(model.ExpenseCategory{Name: name, UID: uid}).
			First(&fallbackRes).Error; err != nil {
			return res, errors.Wrap(err, "failed to find expense category")
		}
		return fallbackRes, nil
	}

	return res, nil
}

func (r *SuitoRepository) HardDeleteAllUserExpenseCategories(uid string) error {
	if err := r.db.Unscoped().Where("uid = ?", uid).Delete(&model.ExpenseCategory{}).Error; err != nil {
		return errors.Wrap(err, "failed to hard delete expense categories")
	}
	return nil
}
