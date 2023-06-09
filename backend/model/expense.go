package model

import "time"

type Expense struct {
	ID                string    `gorm:"type:varchar(20);primaryKey" json:"id"`
	UID               string    `gorm:"type:varchar(128)" json:"-"`
	Title             string    `gorm:"type:varchar(256);not null" json:"title" validate:"required"`
	Amount            int       `gorm:"type:int" json:"amount" validate:"required"`
	Memo              string    `gorm:"type:varchar(512)" json:"memo"`
	ExpenseLocationID string    `gorm:"type:varchar(20)" json:"expense_location_id"`
	ExpenseCategoryID string    `gorm:"type:varchar(20)" json:"expense_category_id"`
	LocalDate         time.Time `gorm:"type:date" json:"local_date" validate:"required"`

	CreatedAt time.Time `json:"-"`
	UpdatedAt time.Time `json:"-"`
}

func (Expense) TableName() string {
	return "expense"
}
