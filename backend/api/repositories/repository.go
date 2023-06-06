package repositories

import (
	"gorm.io/gorm"
)

type SuitoRepository struct {
	db *gorm.DB
}

func NewSuitoRepository(db *gorm.DB) *SuitoRepository {
	return &SuitoRepository{db: db}
}
