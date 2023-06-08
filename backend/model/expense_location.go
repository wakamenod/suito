package model

import "time"

type ExpenseLocation struct {
	ID        string `gorm:"type:varchar(20);primaryKey"`
	UID       string `gorm:"type:varchar(128)"`
	Name      string `gorm:"type:varchar(256)"`
	CreatedAt time.Time
	UpdatedAt time.Time
}

func (ExpenseLocation) TableName() string {
	return "expense_location"
}