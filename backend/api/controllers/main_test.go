package controllers

import (
	"testing"

	"github.com/wakamenod/suito/api/services"
	"github.com/wakamenod/suito/api/services/testdata"
)

var tCon *TransactionController
var eCon *ExpenseController
var iCon *IncomeController
var cCon *ChartController

func TestMain(m *testing.M) {
	ser := services.NewSuitoService(&testdata.TestRepositoryMock)
	tCon = NewTransactionController(ser)
	eCon = NewExpenseController(ser)
	iCon = NewIncomeController(ser)
	cCon = NewChartController(ser)

	m.Run()
}
