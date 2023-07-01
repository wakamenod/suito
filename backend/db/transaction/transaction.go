package transaction

import (
	"errors"

	"gorm.io/gorm"
)

type TransactionHandler interface {
	StartTx(tx *gorm.DB)
	EndTx(db *gorm.DB)
}

type Provider interface {
	Transaction(fc func() error, handlers ...TransactionHandler) error
}

type TestErrorTransactionProvider struct {
	db *gorm.DB
}

type SuitoTransactionProvider struct {
	db *gorm.DB
}

func NewSuitoTransactionProvider(db *gorm.DB) Provider {
	return &SuitoTransactionProvider{db: db}
}

func NewTestErrorTransactionProvider(db *gorm.DB) Provider {
	return &TestErrorTransactionProvider{db: db}
}

// func (p *SuitoTransactionProvider) Transaction(fc func(txRepo srepositories.Repository) error, opts ...*sql.TxOptions) error {
// 	return p.db.Transaction(func(tx *gorm.DB) error {
// 		return fc(repositories.NewSuitoRepository(tx))
// 	})
// }

func (p *SuitoTransactionProvider) Transaction(fc func() error, handlers ...TransactionHandler) error {
	return p.db.Transaction(func(tx *gorm.DB) error {
		for _, h := range handlers {
			h.StartTx(tx)
		}
		defer func() {
			for _, h := range handlers {
				h.EndTx(p.db)
			}
		}()

		return fc()
	})
}

func (p *TestErrorTransactionProvider) Transaction(fc func() error, handlers ...TransactionHandler) error {
	return p.db.Transaction(func(tx *gorm.DB) error {
		for _, h := range handlers {
			h.StartTx(tx)
		}
		defer func() {
			for _, h := range handlers {
				h.EndTx(p.db)
			}
		}()

		if err := fc(); err != nil {
			return err
		}

		return errors.New("error test transaction")
	})
}
