package model

import (
	"time"

	"gorm.io/gorm"
)

type Expense struct {
	ID                string    `gorm:"type:varchar(20);primaryKey" json:"id"`
	UID               string    `gorm:"type:varchar(128)" json:"-"`
	Title             string    `gorm:"type:varchar(256);not null" json:"title" validate:"required"`
	Amount            int       `gorm:"type:int" json:"amount" validate:"required"`
	Memo              string    `gorm:"type:varchar(512)" json:"memo"`
	ExpenseLocationID string    `gorm:"type:varchar(20)" json:"expenseLocationID"`
	ExpenseCategoryID string    `gorm:"type:varchar(20)" json:"expenseCategoryID"`
	LocalDate         time.Time `gorm:"type:date" json:"local_date" validate:"required"`

	DeletedAt gorm.DeletedAt `json:"-"`
	CreatedAt time.Time      `json:"-"`
	UpdatedAt time.Time      `json:"-"`
}

func (Expense) TableName() string {
	return "expense"
}
