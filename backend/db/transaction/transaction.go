package transaction

import (
	"database/sql"

	"github.com/wakamenod/suito/api/repositories"
	srepositories "github.com/wakamenod/suito/api/services/repositories"
	"gorm.io/gorm"
)

type Provider interface {
	Transaction(fc func(txRepo srepositories.Repository) error, opts ...*sql.TxOptions) error
}

type SuitoTransactionProvider struct {
	db *gorm.DB
}

func NewSuitoTransactionProvider(db *gorm.DB) Provider {
	return &SuitoTransactionProvider{db: db}
}

func (p *SuitoTransactionProvider) Transaction(fc func(txRepo srepositories.Repository) error, opts ...*sql.TxOptions) error {
	return p.db.Transaction(func(tx *gorm.DB) error {
		return fc(repositories.NewSuitoRepository(tx))
	})
}
