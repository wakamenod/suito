package model

import "time"

type ScheduledIncome struct {
	ID            string `gorm:"type:varchar(20);primaryKey"`
	UID           string `gorm:"type:varchar(128)"`
	Title         string `gorm:"type:varchar(256)"`
	Amount        int
	Memo          string `gorm:"type:varchar(512)"`
	ScheduledType int8
	CreatedAt     time.Time
	UpdatedAt     time.Time
}

func (ScheduledIncome) TableName() string {
	return "scheduled_income"
}
