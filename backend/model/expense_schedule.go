package model

import (
	"time"

	"gorm.io/gorm"
)

type ExpenseSchedule struct {
	ID                string `gorm:"type:varchar(20);primaryKey"`
	UID               string `gorm:"type:varchar(128)"`
	Title             string `gorm:"type:varchar(256)"`
	Amount            int
	Memo              string          `gorm:"type:varchar(512)"`
	ExpenseCategory   ExpenseCategory `gorm:"foreignKey:ExpenseCategoryID;" json:"expenseCategory"`
	ExpenseCategoryID string          `gorm:"type:varchar(20)"`
	ExpenseLocation   ExpenseLocation `gorm:"foreignKey:ExpenseLocationID;" json:"expenseLocation"`
	ExpenseLocationID string          `gorm:"type:varchar(20)"`
	ScheduleType      int8
	Timezone          string `gorm:"type:varchar(64)" json:"-"`

	DeletedAt gorm.DeletedAt
	CreatedAt time.Time
	UpdatedAt time.Time
}

func (ExpenseSchedule) TableName() string {
	return "expense_schedule"
}
