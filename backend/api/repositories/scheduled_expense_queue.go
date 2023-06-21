package repositories

import (
	"time"

	"github.com/pkg/errors"
	"github.com/wakamenod/suito/model"
)

// 予定時間に達した支出スケジュールキューを取得する
func (r *SuitoRepository) FindScheduledExpenseQueues() ([]model.ScheduledExpenseQueue, error) {
	var res []model.ScheduledExpenseQueue

	if err := r.db.Where("scheduled_at < ?", time.Now().UTC()).
		Order("id").
		Find(&res).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find scheduled_expense_queue")
	}
	return res, nil
}

func (r *SuitoRepository) DeleteScheduledExpenseQueues(queues []model.ScheduledExpenseQueue) error {
	var ids []string
	for _, q := range queues {
		ids = append(ids, q.ID)
	}
	if err := r.db.Where("id IN ?", ids).Delete(&model.ScheduledExpenseQueue{}).Error; err != nil {
		return errors.Wrap(err, "failed to delete schedule expense queue")
	}
	return nil
}
