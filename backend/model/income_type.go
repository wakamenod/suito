package model

import "time"

type IncomeType struct {
	ID        string    `gorm:"type:varchar(20);primaryKey" json:"id" validate:"optional"`
	UID       string    `gorm:"type:varchar(128)" json:"-" validate:"optional"`
	Name      string    `gorm:"type:varchar(256)" json:"name" validate:"required"`
	CreatedAt time.Time `json:"-"`
	UpdatedAt time.Time `json:"-"`
}

func (IncomeType) TableName() string {
	return "income_type"
}
