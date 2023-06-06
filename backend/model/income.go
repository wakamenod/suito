package model

import "time"

type Income struct {
	ID        string `gorm:"type:varchar(20);primaryKey"`
	UID       string `gorm:"type:varchar(128)"`
	Title     string `gorm:"type:varchar(256)"`
	Amount    int
	Memo      string    `gorm:"type:varchar(512)"`
	LocalDate time.Time `gorm:"type:date"`

	CreatedAt time.Time
	UpdatedAt time.Time
}

func (Income) TableName() string {
	return "income"
}
