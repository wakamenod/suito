package model

import (
	"time"

	"gorm.io/gorm"
)

type ScheduledExpenseQueue struct {
	ID                string `gorm:"type:varchar(20);primaryKey"`
	ExpenseScheduleID string `gorm:"type:varchar(20)"`
	ScheduledAt       time.Time

	DeletedAt gorm.DeletedAt
	CreatedAt time.Time
	UpdatedAt time.Time
}

func (ScheduledExpenseQueue) TableName() string {
	return "scheduled_expense_queue"
}
