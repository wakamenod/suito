package services

import (
	"database/sql"
	"testing"

	"github.com/wakamenod/suito/api/services/repositories"
	"github.com/wakamenod/suito/api/services/testdata"
	"github.com/wakamenod/suito/db/transaction"
)

var aSer *SuitoService

func TestMain(m *testing.M) {
	aSer = NewSuitoService(&testdata.TestRepositoryMock, &transaction.ProviderMock{
		TransactionFunc: func(fc func(txRepo repositories.Repository) error, opts ...*sql.TxOptions) error {
			return fc(&testdata.TestRepositoryMock)
		},
	})

	m.Run()
}
