package repositories

import (
	"database/sql"

	"gorm.io/gorm"
)

type SuitoRepository struct {
	db *gorm.DB
}

func NewSuitoRepository(db *gorm.DB) *SuitoRepository {
	return &SuitoRepository{db: db}
}

func (r *SuitoRepository) Transaction(fc func(txRepo *SuitoRepository) error, opts ...*sql.TxOptions) (err error) {
	return r.db.Transaction(func(tx *gorm.DB) error {
		return fc(NewSuitoRepository(tx))
	})
}
