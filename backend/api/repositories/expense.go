package repositories

import (
	"time"

	"github.com/pkg/errors"
	"github.com/rs/xid"
	"github.com/wakamenod/suito/model"
)

type (
	ColumnChartData struct {
		CategoryName string
		Amount       int64
		Month        string
	}
	PieChartData struct {
		Name   string `json:"name"`
		Amount int64  `json:"amount"`
	} // @name PieChartData
)

func (r *SuitoExpenseRepository) FindExpenses(uid string, start, end *time.Time) ([]model.Expense, error) {
	var expenses []model.Expense

	if err := r.db.Where("uid = ? AND local_date >= ? AND local_date < ?", uid, start, end).
		Order("local_date desc").
		Find(&expenses).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find expenses")
	}

	return expenses, nil
}

func (r *SuitoExpenseRepository) FindExpense(id, uid string) (model.Expense, error) {
	var expense model.Expense

	if err := r.db.Where("id = ? AND uid = ?", id, uid).
		First(&expense).Error; err != nil {
		return expense, errors.Wrap(err, "failed to find expense")
	}

	return expense, nil
}

func (r *SuitoExpenseRepository) CreateExpense(uid string, expense model.Expense) (model.Expense, error) {
	expense.ID = xid.New().String()
	expense.UID = uid

	if err := r.db.Create(&expense).Error; err != nil {
		return expense, errors.Wrap(err, "failed to create expenses")
	}

	return expense, nil
}

func (r *SuitoExpenseRepository) UpdateExpense(uid string, expense model.Expense) (model.Expense, error) {
	if err := r.db.Model(&model.Expense{}).
		Where("id = ? AND uid = ?", expense.ID, uid).
		Updates(map[string]any{
			"title":               expense.Title,
			"amount":              expense.Amount,
			"memo":                expense.Memo,
			"expense_category_id": expense.ExpenseCategoryID,
			"expense_location_id": expense.ExpenseLocationID,
			"local_date":          expense.LocalDate,
		}).Error; err != nil {
		return expense, errors.Wrap(err, "failed to update expenses")
	}
	return expense, nil
}

func (r *SuitoExpenseRepository) DeleteExpense(id string, uid string) error {
	if err := r.db.Where("id = ? AND uid = ?", id, uid).Delete(&model.Expense{}).Error; err != nil {
		return errors.Wrap(err, "failed to delete expenses")
	}
	return nil
}

func (r *SuitoExpenseRepository) HardDeleteAllUserExpenses(uid string) error {
	if err := r.db.Unscoped().Where("uid = ?", uid).Delete(&model.Expense{}).Error; err != nil {
		return errors.Wrap(err, "failed to hard delete expenses")
	}
	return nil
}

func (r *SuitoExpenseRepository) FindColumnChartExpenseData(uid string) ([]ColumnChartData, error) {
	var res []ColumnChartData

	if err := r.db.Raw(`
SELECT
    COALESCE(ec.name, '') AS category_name,
    DATE_FORMAT(e.local_date, '%Y-%m') AS month,
    SUM(e.amount) AS amount
FROM
    expense AS e
LEFT JOIN
    expense_category AS ec
    ON ec.id = e.expense_category_id AND ec.uid = ? AND e.deleted_at IS NULL
WHERE
    e.uid = ?
GROUP BY
    ec.name,
    month
ORDER BY
    category_name DESC,
    month ASC
`, uid, uid).Scan(&res).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find expense column chart data")
	}

	return res, nil
}

func (r *SuitoExpenseRepository) FindPieChartCategoryData(uid string, start, end *time.Time) ([]PieChartData, error) {
	var res []PieChartData

	if err := r.db.Raw(`
SELECT
    COALESCE(ec.name, '') AS name,
    SUM(e.amount) AS amount
FROM
    expense AS e
LEFT JOIN
    expense_category AS ec
    ON ec.id = e.expense_category_id AND ec.uid = ? AND e.deleted_at IS NULL
WHERE
    e.uid = ?
    AND local_date >= ? AND local_date < ?
GROUP BY
    ec.name
ORDER BY
    name DESC
`, uid, uid, start, end).Scan(&res).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find expense category pie chart data")
	}

	return res, nil
}

func (r *SuitoExpenseRepository) FindPieChartLocationData(uid string, start, end *time.Time) ([]PieChartData, error) {
	var res []PieChartData

	if err := r.db.Raw(`
SELECT
    COALESCE(el.name, '') AS name,
    SUM(e.amount) AS amount
FROM
    expense AS e
LEFT JOIN
    expense_location AS el
    ON el.id = e.expense_location_id AND el.uid = ? AND e.deleted_at IS NULL
WHERE
    e.uid = ?
    AND local_date >= ? AND local_date < ?
GROUP BY
    el.name
ORDER BY
    name DESC
`, uid, uid, start, end).Scan(&res).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find expense location pie chart data")
	}

	return res, nil
}

// queueのScheduledAtは現地時間の月の初日を表す日時でUTCとして登録されている
// これをexpense_scheduleテーブルのタイムゾーンを使って現地日付に変換しlocal_dateとして登録する
func (r *SuitoExpenseRepository) CreateExpensesFromScheduledQueue(queues []model.ScheduledExpenseQueue) error {
	for _, q := range queues {
		if err := r.db.Exec(`
INSERT INTO expense
(
  id,
  uid,
  title,
  amount,
  memo,
  expense_location_id,
  expense_category_id,
  local_date,
  created_at,
  updated_at,
  deleted_at
)
SELECT
  ?,
  uid,
  title,
  amount,
  memo,
  expense_location_id,
  expense_category_id,
  DATE(CONVERT_TZ(?, 'UTC', timezone)) AS local_date,
  NOW() AS created_at,
  NOW() AS updated_at,
  NULL AS deleted_at
FROM expense_schedule
WHERE id = ?
`, xid.New().String(), q.ScheduledAt, q.ExpenseScheduleID).Error; err != nil {
			return errors.Wrap(err, "failed to insert expense from queue")
		}
	}

	return nil
}
