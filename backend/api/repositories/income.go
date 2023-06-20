package repositories

import (
	"time"

	"github.com/pkg/errors"
	"github.com/rs/xid"
	"github.com/wakamenod/suito/model"
)

func (r *SuitoRepository) FindIncomes(uid string, start, end *time.Time) ([]model.Income, error) {
	var incomes []model.Income

	if err := r.db.Preload("IncomeType").Where("uid = ? AND local_date >= ? AND local_date < ?", uid, start, end).
		Order("local_date desc").
		Find(&incomes).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find incomes")
	}

	return incomes, nil
}

func (r *SuitoRepository) FindIncome(id, uid string) (model.Income, error) {
	var income model.Income

	if err := r.db.Preload("IncomeType").Where("id = ? AND uid = ?", id, uid).
		First(&income).Error; err != nil {
		return income, errors.Wrap(err, "failed to find income")
	}

	return income, nil
}

func (r *SuitoRepository) CreateIncome(uid string, income model.Income) (model.Income, error) {
	income.ID = xid.New().String()
	income.UID = uid

	if err := r.db.Create(&income).Error; err != nil {
		return income, errors.Wrap(err, "failed to create incomes")
	}

	return income, nil
}

func (r *SuitoRepository) UpdateIncome(uid string, income model.Income) (model.Income, error) {
	if err := r.db.Where("uid = ?", uid).Updates(&income).Error; err != nil {
		return income, errors.Wrap(err, "failed to update incomes")
	}
	return income, nil
}

func (r *SuitoRepository) HardDeleteAllUserIncomes(uid string) error {
	if err := r.db.Unscoped().Where("uid = ?", uid).Delete(&model.Income{}).Error; err != nil {
		return errors.Wrap(err, "failed to hard delete incomes")
	}
	return nil
}

func (r *SuitoRepository) FindColumnChartIncomeData(uid string) ([]ColumnChartData, error) {
	var months []ColumnChartData

	if err := r.db.Raw(`
SELECT
    COALESCE(it.name, '') AS category_name,
    DATE_FORMAT(i.local_date, '%Y-%m') AS month,
    SUM(i.amount) AS amount
FROM
    income AS i
LEFT JOIN
    income_type AS it
    ON it.id = i.income_type_id AND it.uid = ? AND i.deleted_at IS NULL
WHERE
    i.uid = ?
GROUP BY
    it.name,
    month
ORDER BY
    category_name DESC,
    month ASC
`, uid, uid).Scan(&months).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find income chart data")
	}

	return months, nil
}
