package model

import "time"

type IncomeSchedule struct {
	ID           string `gorm:"type:varchar(20);primaryKey"`
	UID          string `gorm:"type:varchar(128)"`
	IncomeTypeID string `gorm:"type:varchar(20)" json:"-"`
	Amount       int
	Memo         string `gorm:"type:varchar(512)"`
	ScheduleType int8
	CreatedAt    time.Time
	UpdatedAt    time.Time
}

func (IncomeSchedule) TableName() string {
	return "income_schedule"
}
