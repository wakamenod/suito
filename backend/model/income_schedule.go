package model

import (
	"time"

	"gorm.io/gorm"
)

type IncomeSchedule struct {
	ID           string     `gorm:"type:varchar(20);primaryKey"`
	UID          string     `gorm:"type:varchar(128)"`
	IncomeType   IncomeType `gorm:"foreignKey:IncomeTypeID;" json:"income_type"`
	IncomeTypeID string     `gorm:"type:varchar(20)" json:"-"`
	Amount       int
	Memo         string `gorm:"type:varchar(512)"`
	Timezone     string `gorm:"type:varchar(64)" json:"-"`
	ScheduleType int8

	DeletedAt gorm.DeletedAt
	CreatedAt time.Time
	UpdatedAt time.Time
}

func (IncomeSchedule) TableName() string {
	return "income_schedule"
}
