package model

import "time"

type ScheduledExpenseQueue struct {
	ID                 string `gorm:"type:varchar(20);primaryKey"`
	ScheduledExpenseID string `gorm:"type:varchar(20)"`
	ScheduledAt        time.Time
	CreatedAt          time.Time
	UpdatedAt          time.Time
}

func (ScheduledExpenseQueue) TableName() string {
	return "scheduled_expense_queue"
}
