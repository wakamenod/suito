package controllers

import (
	"testing"

	"github.com/wakamenod/suito/api/services"
	"github.com/wakamenod/suito/api/services/testdata"
)

var tCon *TransactionController

func TestMain(m *testing.M) {
	repo := testdata.NewRepositoryMock()
	ser := services.NewSuitoService(repo)
	tCon = NewTransactionController(ser)

	m.Run()
}
