package model

import (
	"time"

	"gorm.io/gorm"
)

type IncomeSchedule struct {
	ID           string `gorm:"type:varchar(20);primaryKey" json:"id"`
	UID          string `gorm:"type:varchar(128)" json:"-"`
	IncomeTypeID string `gorm:"type:varchar(20)" json:"incomeTypeId"`
	Amount       int    `gorm:"type:int" json:"amount" validate:"required"`
	Memo         string `gorm:"type:varchar(512)" json:"memo"`
	Timezone     string `gorm:"type:varchar(64)" json:"timezone" validate:"required"`
	ScheduleType int8

	DeletedAt gorm.DeletedAt
	CreatedAt time.Time
	UpdatedAt time.Time
}

func (IncomeSchedule) TableName() string {
	return "income_schedule"
}
