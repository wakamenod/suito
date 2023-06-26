package repositories

import (
	"time"

	"github.com/pkg/errors"
	"github.com/wakamenod/suito/model"
)

// 予定時間に達した支出スケジュールキューを取得する
func (r *SuitoRepository) FindScheduledDueExpenseQueues() ([]model.ScheduledExpenseQueue, error) {
	var res []model.ScheduledExpenseQueue

	if err := r.db.Where("scheduled_at < ?", time.Now().UTC()).
		Order("expense_schedule_id").
		Find(&res).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find scheduled_expense_queue")
	}
	return res, nil
}

func (r *SuitoRepository) DeleteScheduledExpenseQueues(queues []model.ScheduledExpenseQueue) error {
	var ids []string
	for _, q := range queues {
		ids = append(ids, q.ExpenseScheduleID)
	}
	if err := r.db.Where("expense_schedule_id IN ?", ids).Delete(&model.ScheduledExpenseQueue{}).Error; err != nil {
		return errors.Wrap(err, "failed to delete schedule expense queue")
	}
	return nil
}

// キューイングされていないexpense scheduleを検索しインサートします
func (r *SuitoRepository) EnqueueExpenseSchedule() error {
	// 0. CONVERT_TZ(NOW(), 'UTC', s.timezone)で現地時間の現在時刻を取得します
	// 1. DATE_ADD INTERVAL 1 MONTH で現地現在時刻に1ヶ月をプラスします
	// 2. DATE_FORMAT()を使用して、その日付の年と月を抽出し、日にちは常に01（月の初日）として設定し、時間を03:00:00と指定します。
	// 3. STR_TO_DATE()を使用してその文字列を日時形式に変換します。
	// 4. CONVERT_TZでUTC時刻に変換します

	if err := r.db.Exec(`
INSERT INTO scheduled_expense_queue
(
  expense_schedule_id,
  scheduled_at,
  created_at,
  updated_at
)
SELECT
  s.id as expense_schedule_id,
  CONVERT_TZ(STR_TO_DATE(DATE_FORMAT(DATE_ADD(CONVERT_TZ(NOW(), 'UTC', s.timezone), INTERVAL 1 MONTH), '%Y-%m-01 03:00:00'), '%Y-%m-%d %H:%i:%s'),s.timezone, 'UTC')  as scheduled_at,
  NOW() AS created_at,
  NOW() AS updated_at
FROM expense_schedule s
LEFT JOIN scheduled_expense_queue q ON q.expense_schedule_id = s.id
WHERE q.expense_schedule_id is NULL
      AND s.deleted_at IS NULL
`).Error; err != nil {
		return errors.Wrap(err, "failed to insert expense schedule queue")
	}

	return nil
}
