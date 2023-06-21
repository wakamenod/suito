package model

import "time"

type ExpenseSchedule struct {
	ID                string `gorm:"type:varchar(20);primaryKey"`
	UID               string `gorm:"type:varchar(128)"`
	Title             string `gorm:"type:varchar(256)"`
	Amount            int
	Memo              string `gorm:"type:varchar(512)"`
	ExpenseLocationID string `gorm:"type:varchar(20)"`
	ExpenseCategoryID string `gorm:"type:varchar(20)"`
	ScheduleType      int8
	CreatedAt         time.Time
	UpdatedAt         time.Time
}

func (ExpenseSchedule) TableName() string {
	return "expense_schedule"
}
