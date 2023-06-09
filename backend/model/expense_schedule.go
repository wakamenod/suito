package model

import (
	"time"

	"gorm.io/gorm"
)

type ExpenseSchedule struct {
	ID                string `gorm:"type:varchar(20);primaryKey" json:"id"`
	UID               string `gorm:"type:varchar(128)" json:"-"`
	Title             string `gorm:"type:varchar(256)" json:"title" validate:"required"`
	Amount            int    `gorm:"type:int" json:"amount" validate:"required"`
	Memo              string `gorm:"type:varchar(512)" json:"memo"`
	ExpenseCategoryID string `gorm:"type:varchar(20)" json:"expenseCategoryID"`
	ExpenseLocationID string `gorm:"type:varchar(20)" json:"expenseLocationID"`
	ScheduleType      int8
	Timezone          string `gorm:"type:varchar(64)" json:"timezone" validate:"required"`

	DeletedAt gorm.DeletedAt
	CreatedAt time.Time
	UpdatedAt time.Time
}

func (ExpenseSchedule) TableName() string {
	return "expense_schedule"
}
