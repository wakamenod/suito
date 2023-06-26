package model

import (
	"time"
)

type ScheduledIncomeQueue struct {
	IncomeScheduleID string `gorm:"type:varchar(20);primaryKey"`
	ScheduledAt      time.Time

	CreatedAt time.Time
	UpdatedAt time.Time
}

func (ScheduledIncomeQueue) TableName() string {
	return "scheduled_income_queue"
}
