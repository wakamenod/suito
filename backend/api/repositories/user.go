package repositories

import (
	"github.com/pkg/errors"
	"github.com/rs/xid"
	"github.com/wakamenod/suito/model"
	"gorm.io/gorm"
)

func (r *SuitoUserRepository) FindAllUIDs() ([]string, error) {
	var uids []string
	if err := r.db.Model(&model.User{}).Pluck("uid", &uids).Error; err != nil {
		return nil, errors.Wrap(err, "failed to pluck user uids")
	}
	return uids, nil
}

func (r *SuitoUserRepository) DeleteUsers(uids []string) error {
	if err := r.db.Where("uid IN ?", uids).Delete(&model.User{}).Error; err != nil {
		return errors.Wrap(err, "failed to delete users")
	}
	return nil
}

func (r *SuitoUserRepository) FindOrCreateUser(uid string) (model.User, error) {
	var res model.User

	err := r.db.Transaction(func(tx *gorm.DB) error {
		if err := tx.Where(model.ExpenseCategory{UID: uid}).
			Attrs(model.ExpenseCategory{ID: xid.New().String()}).
			FirstOrCreate(&res).Error; err != nil {
			return errors.Wrap(err, "failed to find or create user")
		}
		return nil
	})
	if err != nil {
		if !errors.Is(err, gorm.ErrDuplicatedKey) {
			return res, err
		}
		var fallbackRes model.User
		if err := r.db.Where(model.User{UID: uid}).
			First(&fallbackRes).Error; err != nil {
			return res, errors.Wrap(err, "failed to find user")
		}
		return fallbackRes, nil
	}

	return res, nil
}
