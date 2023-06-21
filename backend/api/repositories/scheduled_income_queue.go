package repositories

import (
	"time"

	"github.com/pkg/errors"
	"github.com/wakamenod/suito/model"
)

// 予定時間に達した支出スケジュールキューを取得する
func (r *SuitoRepository) FindScheduledIncomeQueues() ([]model.ScheduledIncomeQueue, error) {
	var res []model.ScheduledIncomeQueue

	if err := r.db.Where("scheduled_at < ?", time.Now().UTC()).
		Order("id").
		Find(&res).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find scheduled_income_queue")
	}
	return res, nil
}
