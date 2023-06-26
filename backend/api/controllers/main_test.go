package controllers

import (
	"database/sql"
	"testing"

	"github.com/wakamenod/suito/api/services"
	"github.com/wakamenod/suito/api/services/repositories"
	"github.com/wakamenod/suito/api/services/testdata"
	"github.com/wakamenod/suito/db/transaction"
)

var tCon *TransactionController
var eCon *ExpenseController
var iCon *IncomeController
var cCon *ChartController
var sCon *TransactionScheduleController
var esCon *ExpenseScheduleController
var isCon *IncomeScheduleController

func TestMain(m *testing.M) {
	ser := services.NewSuitoService(&testdata.TestRepositoryMock, &transaction.ProviderMock{
		TransactionFunc: func(fc func(txRepo repositories.Repository) error, opts ...*sql.TxOptions) error {
			return fc(&testdata.TestRepositoryMock)
		},
	})
	tCon = NewTransactionController(ser)
	eCon = NewExpenseController(ser)
	iCon = NewIncomeController(ser)
	cCon = NewChartController(ser)
	sCon = NewTransactionScheduleController(ser)
	esCon = NewExpenseScheduleController(ser)
	isCon = NewIncomeScheduleController(ser)

	m.Run()
}
