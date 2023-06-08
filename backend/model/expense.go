package model

import "time"

type Expense struct {
	ID                string    `gorm:"type:varchar(20);primaryKey"`
	UID               string    `gorm:"type:varchar(128)"`
	Title             string    `gorm:"type:varchar(256);not null" json:"title" validate:"required"`
	Amount            int       `json:"amount" validate:"required"`
	Memo              string    `gorm:"type:varchar(512)" json:"memo,omitempty"`
	ExpenseLocationID string    `gorm:"type:varchar(20)" json:"expense_location_id,omitempty"`
	ExpenseCategoryID string    `gorm:"type:varchar(20)" json:"expense_category_id,omitempty"`
	LocalDate         time.Time `gorm:"type:date" json:"local_date" validate:"required"`
	CreatedAt         time.Time
	UpdatedAt         time.Time
}

func (Expense) TableName() string {
	return "expense"
}
