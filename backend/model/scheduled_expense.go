package model

import "time"

type ScheduledExpense struct {
	ID                string `gorm:"type:varchar(20);primaryKey"`
	UID               string `gorm:"type:varchar(128)"`
	Title             string `gorm:"type:varchar(256)"`
	Amount            int
	Memo              string `gorm:"type:varchar(512)"`
	ExpenseLocationID string `gorm:"type:varchar(20)"`
	ExpenseCategoryID string `gorm:"type:varchar(20)"`
	ScheduledType     int8
	CreatedAt         time.Time
	UpdatedAt         time.Time
}

func (ScheduledExpense) TableName() string {
	return "scheduled_expense"
}
