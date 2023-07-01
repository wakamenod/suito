package services

import (
	"testing"

	"github.com/wakamenod/suito/api/services/testdata"
	"github.com/wakamenod/suito/db/transaction"
)

var transactionSer *SuitoTransactionService
var expenseSer *SuitoExpenseService
var incomeSer *SuitoIncomeService
var chartSer *SuitoChartService
var transactionScheduleSer *SuitoTransactionScheduleService
var expenseScheduleSer *SuitoExpenseScheduleService
var incomeScheduleSer *SuitoIncomeScheduleService
var expenseCategorySer *SuitoExpenseCategoryService
var expenseLocationSer *SuitoExpenseLocationService
var incomeTypeSer *SuitoIncomeTypeService

func TestMain(m *testing.M) {
	mockTransactionProvider := transaction.ProviderMock{
		TransactionFunc: func(fc func() error, handlers ...transaction.TransactionHandler) error {
			return fc()
		},
	}

	transactionSer = NewSuitoTransactionService(&testdata.ExpenseRepositoryMock, &testdata.IncomeRepositoryMock, &testdata.TransactionMonthsRepositoryMock)
	expenseSer = NewSuitoExpenseService(&testdata.ExpenseRepositoryMock, &testdata.ExpenseCategoryRepositoryMock, &testdata.ExpenseLocationRepositoryMock)
	incomeSer = NewSuitoIncomeService(&testdata.IncomeRepositoryMock)
	chartSer = NewSuitoChartService(&testdata.ExpenseRepositoryMock, &testdata.IncomeRepositoryMock)
	transactionScheduleSer = NewSuitoTransactionScheduleService(&testdata.ExpenseScheduleRepositoryMock, &testdata.IncomeScheduleRepositoryMock)
	expenseScheduleSer = NewSuitoExpenseScheduleService(&testdata.ExpenseScheduleRepositoryMock, &mockTransactionProvider)
	incomeScheduleSer = NewSuitoIncomeScheduleService(&testdata.IncomeScheduleRepositoryMock, &mockTransactionProvider)
	expenseCategorySer = NewSuitoExpenseCategoryService(&testdata.ExpenseCategoryRepositoryMock)
	expenseLocationSer = NewSuitoExpenseLocationService(&testdata.ExpenseLocationRepositoryMock)
	incomeTypeSer = NewSuitoIncomeTypeService(&testdata.IncomeTypeRepositoryMock)

	m.Run()
}
