package model

import "time"

type IncomeType struct {
	ID        string    `gorm:"type:varchar(20);primaryKey" json:"id"`
	UID       string    `gorm:"type:varchar(128)" json:"-"`
	Name      string    `gorm:"type:varchar(256)" json:"name"`
	CreatedAt time.Time `json:"-"`
	UpdatedAt time.Time `json:"-"`
}

func (IncomeType) TableName() string {
	return "income_type"
}
