package model

import (
	"time"
)

type ScheduledExpenseQueue struct {
	ExpenseScheduleID string `gorm:"type:varchar(20);primaryKey"`
	ScheduledAt       time.Time

	CreatedAt time.Time
	UpdatedAt time.Time
}

func (ScheduledExpenseQueue) TableName() string {
	return "scheduled_expense_queue"
}
