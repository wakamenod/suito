package model

import (
	"time"

	"gorm.io/gorm"
)

type Income struct {
	ID           string    `gorm:"type:varchar(20);primaryKey" json:"id"`
	UID          string    `gorm:"type:varchar(128)" json:"-"`
	IncomeTypeID string    `gorm:"type:varchar(20)" json:"incomeTypeId"`
	Amount       int       `gorm:"type:int" json:"amount" validate:"required"`
	Memo         string    `gorm:"type:varchar(512)" json:"memo"`
	LocalDate    time.Time `gorm:"type:date" json:"local_date" validate:"required"`

	DeletedAt gorm.DeletedAt `json:"-"`
	CreatedAt time.Time      `json:"-"`
	UpdatedAt time.Time      `json:"-"`
}

func (Income) TableName() string {
	return "income"
}
