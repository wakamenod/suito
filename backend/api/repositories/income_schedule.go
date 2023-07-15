package repositories

import (
	"time"

	"github.com/pkg/errors"
	"github.com/rs/xid"
	"github.com/wakamenod/suito/model"
)

func (r *SuitoIncomeScheduleRepository) FindIncomeSchedules(uid string) ([]model.IncomeSchedule, error) {
	var res []model.IncomeSchedule

	if err := r.db.Where("uid = ?", uid).
		Order("id").
		Find(&res).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find income schedules")
	}

	return res, nil
}

func (r *SuitoIncomeScheduleRepository) FindIncomeSchedule(id, uid string) (model.IncomeSchedule, error) {
	var res model.IncomeSchedule

	if err := r.db.Where("id = ? AND uid = ?", id, uid).
		First(&res).Error; err != nil {
		return res, errors.Wrap(err, "failed to income income schedule")
	}

	return res, nil
}

func (r *SuitoIncomeScheduleRepository) UpdateIncomeSchedule(uid string, incomeSchedule model.IncomeSchedule) (model.IncomeSchedule, error) {
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

func (r *SuitoIncomeScheduleRepository) DeleteIncomeSchedule(id string, uid string) error {
	if err := r.db.Where("id = ? AND uid = ?", id, uid).Delete(&model.IncomeSchedule{}).Error; err != nil {
		return errors.Wrap(err, "failed to delete income schedule")
	}
	return nil
}

func (r *SuitoIncomeScheduleRepository) CreateIncomeSchedule(uid string, incomeSchedule model.IncomeSchedule) (model.IncomeSchedule, error) {
	incomeSchedule.ID = xid.New().String()
	incomeSchedule.UID = uid

	if err := r.db.Create(&incomeSchedule).Error; err != nil {
		return incomeSchedule, errors.Wrap(err, "failed to create income schedule")
	}

	return incomeSchedule, nil
}

// 予定時間に達した支出スケジュールキューを取得する
func (r *SuitoIncomeScheduleRepository) FindScheduledDueIncomeQueues() ([]model.ScheduledIncomeQueue, error) {
	var res []model.ScheduledIncomeQueue

	if err := r.db.Where("scheduled_at < ?", time.Now().UTC()).
		Order("income_schedule_id").
		Find(&res).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find scheduled_income_queue")
	}
	return res, nil
}

// キューイングされていないincome scheduleを検索しインサートします
func (r *SuitoIncomeScheduleRepository) EnqueueIncomeSchedule() error {
	// 0. CONVERT_TZ(NOW(), 'UTC', s.timezone)で現地時間の現在時刻を取得します
	// 1. DATE_ADD INTERVAL 1 MONTH で現地現在時刻に1ヶ月をプラスします
	// 2. DATE_FORMAT()を使用して、その日付の年と月を抽出し、日にちは常に01（月の初日）として設定し、時間を03:00:00と指定します。
	// 3. STR_TO_DATE()を使用してその文字列を日時形式に変換します。
	// 4. CONVERT_TZでUTC時刻に変換します

	if err := r.db.Exec(`
INSERT INTO scheduled_income_queue
(
  income_schedule_id,
  scheduled_at,
  created_at,
  updated_at
)
SELECT
  s.id as income_schedule_id,
  CONVERT_TZ(STR_TO_DATE(DATE_FORMAT(DATE_ADD(CONVERT_TZ(NOW(), 'UTC', s.timezone), INTERVAL 1 MONTH), '%Y-%m-01 03:00:00'), '%Y-%m-%d %H:%i:%s'),s.timezone, 'UTC')  as scheduled_at,
  NOW() AS created_at,
  NOW() AS updated_at
FROM income_schedule s
LEFT JOIN scheduled_income_queue q ON q.income_schedule_id = s.id
WHERE q.income_schedule_id is NULL
      AND s.deleted_at IS NULL
`).Error; err != nil {
		return errors.Wrap(err, "failed to insert income schedule queue")
	}

	return nil
}

func (r *SuitoIncomeScheduleRepository) DeleteScheduledIncomeQueues(queues []model.ScheduledIncomeQueue) error {
	var ids []string
	for _, q := range queues {
		ids = append(ids, q.IncomeScheduleID)
	}
	if err := r.db.Where("income_schedule_id IN ?", ids).Delete(&model.ScheduledIncomeQueue{}).Error; err != nil {
		return errors.Wrap(err, "failed to delete schedule income queue")
	}
	return nil
}
