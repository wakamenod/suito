package repositories

import (
	"github.com/pkg/errors"
	"github.com/rs/xid"
	"github.com/wakamenod/suito/model"
	"gorm.io/gorm"
)

func (r *SuitoExpenseCategoryRepository) FindExpenseCategories(uid string) ([]model.ExpenseCategory, error) {
	var res []model.ExpenseCategory

	if err := r.db.Where("uid = ?", uid).
		Order("id desc").
		Find(&res).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find expense categories")
	}

	return res, nil
}

func (r *SuitoExpenseCategoryRepository) FindExpenseCategory(id string, uid string) (model.ExpenseCategory, error) {
	var res model.ExpenseCategory

	if err := r.db.Where(model.ExpenseCategory{ID: id, UID: uid}).
		First(&res).Error; err != nil {
		return res, errors.Wrap(err, "failed to find expense category")
	}

	return res, nil
}

func (r *SuitoExpenseCategoryRepository) CreateExpenseCategory(uid string, category model.ExpenseCategory) (model.ExpenseCategory, error) {
	category.ID = xid.New().String()
	category.UID = uid

	if err := r.db.Create(&category).Error; err != nil {
		return category, errors.Wrap(err, "failed to create expense category")
	}

	return category, nil
}

func (r *SuitoExpenseCategoryRepository) UpdateExpenseCategory(uid string, expenseCategory model.ExpenseCategory) (model.ExpenseCategory, error) {
	if err := r.db.Model(&model.ExpenseCategory{}).
		Where("id = ? AND uid = ?", expenseCategory.ID, uid).
		Updates(map[string]any{
			"name": expenseCategory.Name,
		}).Error; err != nil {
		return expenseCategory, errors.Wrap(err, "failed to update expenseCategorys")
	}
	return expenseCategory, nil
}

func (r *SuitoExpenseCategoryRepository) DeleteExpenseCategory(id string, uid string) error {
	if err := r.db.Where("id = ? AND uid = ?", id, uid).Delete(&model.ExpenseCategory{}).Error; err != nil {
		return errors.Wrap(err, "failed to delete expenseCategory")
	}
	if err := r.db.Model(&model.Expense{}).
		Where("expense_category_id = ? AND uid = ?", id, uid).
		Updates(map[string]any{
			"expense_category_id": "",
		}).Error; err != nil {
		return errors.Wrap(err, "failed to update expense_category_id")
	}
	return nil
}

func (r *SuitoExpenseCategoryRepository) FindOrCreateExpenseCategory(uid string, name string) (model.ExpenseCategory, error) {
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

func (r *SuitoExpenseCategoryRepository) HardDeleteAllUserExpenseCategories(uid string) error {
	if err := r.db.Unscoped().Where("uid = ?", uid).Delete(&model.ExpenseCategory{}).Error; err != nil {
		return errors.Wrap(err, "failed to hard delete expense categories")
	}
	return nil
}
