package model

import "time"

type ExpenseCategory struct {
	ID        string    `gorm:"type:varchar(20);primaryKey" json:"id"`
	UID       string    `gorm:"type:varchar(128)" json:"uid"`
	Name      string    `gorm:"type:varchar(256)" json:"name"`
	CreatedAt time.Time `json:"-"`
	UpdatedAt time.Time `json:"-"`
}

func (ExpenseCategory) TableName() string {
	return "expense_category"
}
