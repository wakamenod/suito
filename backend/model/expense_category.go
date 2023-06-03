package model

import "time"

type ExpenseCategory struct {
	ID        string `gorm:"type:varchar(20);primaryKey"`
	UID       string `gorm:"type:varchar(128)"`
	Name      string `gorm:"type:varchar(256)"`
	CreatedAt time.Time
	UpdatedAt time.Time
}

func (ExpenseCategory) TableName() string {
	return "expense_category"
}
