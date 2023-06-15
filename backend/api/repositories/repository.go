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

func (r *SuitoRepository) Transaction(fc func(tx *gorm.DB) error, opts ...*sql.TxOptions) (err error) {
	return r.db.Transaction(fc, opts...)

	// TODO
	// return r.db.Transaction(func(tx *gorm.DB) error {
	// 	tmp := r.db
	// 	r.db = tx
	// 	defer func() { r.db = tmp }()
	// 	return fc(tx)
	// })
}
