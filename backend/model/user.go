package model

import (
	"time"

	"gorm.io/gorm"
)

type User struct {
	ID  string `gorm:"type:varchar(20);primaryKey" json:"id"`
	UID string `gorm:"type:varchar(128)" json:"-"`

	DeletedAt gorm.DeletedAt `json:"-"`
	CreatedAt time.Time      `json:"-"`
	UpdatedAt time.Time      `json:"-"`
}

func (User) TableName() string {
	return "user"
}
