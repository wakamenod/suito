package model

import "time"

type ExpenseSplit struct {
	ID        string `gorm:"type:varchar(20);primaryKey"`
	ExpenseID string `gorm:"type:varchar(20)"`
	Amount    int
	CreatedAt time.Time
	UpdatedAt time.Time
}

func (ExpenseSplit) TableName() string {
	return "expense_split"
}
