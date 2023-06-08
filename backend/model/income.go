package model

import "time"

type Income struct {
	ID        string    `gorm:"type:varchar(20);primaryKey"`
	UID       string    `gorm:"type:varchar(128)"`
	Title     string    `gorm:"type:varchar(256)" validate:"required"`
	Amount    int       `json:"amount" validate:"required"`
	Memo      string    `gorm:"type:varchar(512)" json:"memo,omitempty"`
	LocalDate time.Time `gorm:"type:date" json:"local_date" validate:"required"`

	CreatedAt time.Time
	UpdatedAt time.Time
}

func (Income) TableName() string {
	return "income"
}
