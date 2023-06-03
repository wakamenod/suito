package model

import "time"

type ScheduledIncomeQueue struct {
	ID                string `gorm:"type:varchar(20);primaryKey"`
	ScheduledIncomeID string `gorm:"type:varchar(20)"`
	ScheduledAt       time.Time
	CreatedAt         time.Time
	UpdatedAt         time.Time
}

func (ScheduledIncomeQueue) TableName() string {
	return "scheduled_income_queue"
}
