package controllers

import (
	"testing"

	"github.com/wakamenod/suito/api/services"
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
var categoryCon *ExpenseCategoryController
var locationCon *ExpenseLocationController
var incomeTypeCon *IncomeTypeController

func TestMain(m *testing.M) {
	mockTransactionProvider := transaction.ProviderMock{
		TransactionFunc: func(fc func() error, handlers ...transaction.TransactionHandler) error {
			return fc()
		},
	}

	transactionSer := services.NewSuitoTransactionService(&testdata.ExpenseRepositoryMock, &testdata.IncomeRepositoryMock, &testdata.IncomeTypeRepositoryMock, &testdata.TransactionMonthsRepositoryMock)
	expenseSer := services.NewSuitoExpenseService(&testdata.ExpenseRepositoryMock, &testdata.ExpenseCategoryRepositoryMock, &testdata.ExpenseLocationRepositoryMock)
	incomeSer := services.NewSuitoIncomeService(&testdata.IncomeRepositoryMock)
	chartSer := services.NewSuitoChartService(&testdata.ExpenseRepositoryMock, &testdata.IncomeRepositoryMock)
	transactionScheduleSer := services.NewSuitoTransactionScheduleService(&testdata.ExpenseScheduleRepositoryMock, &testdata.IncomeScheduleRepositoryMock)
	expenseScheduleSer := services.NewSuitoExpenseScheduleService(&testdata.ExpenseScheduleRepositoryMock, &mockTransactionProvider)
	incomeScheduleSer := services.NewSuitoIncomeScheduleService(&testdata.IncomeScheduleRepositoryMock, &mockTransactionProvider)
	categorySer := services.NewSuitoExpenseCategoryService(&testdata.ExpenseCategoryRepositoryMock)
	locationSer := services.NewSuitoExpenseLocationService(&testdata.ExpenseLocationRepositoryMock)
	incomeTypeSer := services.NewSuitoIncomeTypeService(&testdata.IncomeTypeRepositoryMock)

	tCon = NewTransactionController(transactionSer)
	eCon = NewExpenseController(expenseSer)
	iCon = NewIncomeController(incomeSer)
	cCon = NewChartController(chartSer)
	sCon = NewTransactionScheduleController(transactionScheduleSer)
	esCon = NewExpenseScheduleController(expenseScheduleSer)
	isCon = NewIncomeScheduleController(incomeScheduleSer)
	categoryCon = NewExpenseCategoryController(categorySer)
	locationCon = NewExpenseLocationController(locationSer)
	incomeTypeCon = NewIncomeTypeController(incomeTypeSer)

	m.Run()
}
