package controllers

import (
	"testing"

	"github.com/wakamenod/suito/api/services"
	"github.com/wakamenod/suito/api/services/testdata"
)

var tCon *TransactionController
var eCon *ExpenseController
var iCon *IncomeController

func TestMain(m *testing.M) {
	repo := testdata.NewRepositoryMock()
	ser := services.NewSuitoService(repo)
	tCon = NewTransactionController(ser)
	eCon = NewExpenseController(ser)
	iCon = NewIncomeController(ser)

	m.Run()
}
