package services

import (
	"github.com/wakamenod/suito/api/services/repositories"
	"github.com/wakamenod/suito/client"
	"github.com/wakamenod/suito/db/transaction"
)

type SuitoChartService struct {
	expenseRepo repositories.ExpenseRepository
	incomeRepo  repositories.IncomeRepository
}

type SuitoTransactionService struct {
	expenseRepo           repositories.ExpenseRepository
	incomeRepo            repositories.IncomeRepository
	transactionMonthsRepo repositories.TransactionMonthsRepository
}

type SuitoDeleteUserJobService struct {
	expenseCategoryRepo repositories.ExpenseCategoryRepository
	expenseLocationRepo repositories.ExpenseLocationRepository
	expenseRepo         repositories.ExpenseRepository
	incomeRepo          repositories.IncomeRepository
	userRepo            repositories.UserRepository
	authClient          client.AuthClient
	transaction.Provider
}

type SuitoExpenseScheduleService struct {
	expenseScheduleRepo repositories.ExpenseScheduleRepository
	transaction.Provider
}

type SuitoIncomeScheduleService struct {
	incomeScheduleRepo repositories.IncomeScheduleRepository
	transaction.Provider
}

type SuitoExpenseService struct {
	expenseRepo         repositories.ExpenseRepository
	expenseCategoryRepo repositories.ExpenseCategoryRepository
	expenseLocationRepo repositories.ExpenseLocationRepository
}

type SuitoIncomeService struct {
	incomeRepo     repositories.IncomeRepository
	incomeTypeRepo repositories.IncomeTypeRepository
}

type SuitoScheduleJobService struct {
	expenseScheduleRepo repositories.ExpenseScheduleRepository
	expenseRepo         repositories.ExpenseRepository
	incomeScheduleRepo  repositories.IncomeScheduleRepository
	incomeRepo          repositories.IncomeRepository
	transaction.Provider
}

type SuitoTransactionScheduleService struct {
	expenseScheduleRepo repositories.ExpenseScheduleRepository
	incomeScheduleRepo  repositories.IncomeScheduleRepository
}

func NewSuitoChartService(exRepo repositories.ExpenseRepository, inRepo repositories.IncomeRepository) *SuitoChartService {
	return &SuitoChartService{expenseRepo: exRepo, incomeRepo: inRepo}
}

func NewSuitoTransactionService(
	expenseRepo repositories.ExpenseRepository,
	incomeRepo repositories.IncomeRepository,
	transactionMonthsRepo repositories.TransactionMonthsRepository,
) *SuitoTransactionService {
	return &SuitoTransactionService{
		expenseRepo:           expenseRepo,
		incomeRepo:            incomeRepo,
		transactionMonthsRepo: transactionMonthsRepo,
	}
}

func NewSuitoDeleteUserJobService(
	expenseCategoryRepo repositories.ExpenseCategoryRepository,
	expenseLocationRepo repositories.ExpenseLocationRepository,
	expenseRepo repositories.ExpenseRepository,
	incomeRepo repositories.IncomeRepository,
	userRepo repositories.UserRepository,
	transactionProvider transaction.Provider,
	authClient client.AuthClient,
) *SuitoDeleteUserJobService {
	return &SuitoDeleteUserJobService{
		expenseCategoryRepo: expenseCategoryRepo,
		expenseLocationRepo: expenseLocationRepo,
		expenseRepo:         expenseRepo,
		incomeRepo:          incomeRepo,
		userRepo:            userRepo,
		Provider:            transactionProvider,
		authClient:          authClient,
	}
}

func NewSuitoExpenseScheduleService(
	expenseScheduleRepo repositories.ExpenseScheduleRepository,
	transactionProvider transaction.Provider,
) *SuitoExpenseScheduleService {
	return &SuitoExpenseScheduleService{
		expenseScheduleRepo: expenseScheduleRepo,
		Provider:            transactionProvider,
	}
}

func NewSuitoIncomeScheduleService(
	incomeScheduleRepo repositories.IncomeScheduleRepository,
	transactionProvider transaction.Provider,
) *SuitoIncomeScheduleService {
	return &SuitoIncomeScheduleService{
		incomeScheduleRepo: incomeScheduleRepo,
		Provider:           transactionProvider,
	}
}

func NewSuitoExpenseService(
	expenseRepo repositories.ExpenseRepository,
	expenseCategoryRepo repositories.ExpenseCategoryRepository,
	expenseLocationRepo repositories.ExpenseLocationRepository,
) *SuitoExpenseService {
	return &SuitoExpenseService{
		expenseRepo:         expenseRepo,
		expenseCategoryRepo: expenseCategoryRepo,
		expenseLocationRepo: expenseLocationRepo,
	}
}

func NewSuitoIncomeService(
	incomeRepo repositories.IncomeRepository,
	incomeTypeRepo repositories.IncomeTypeRepository,
) *SuitoIncomeService {
	return &SuitoIncomeService{
		incomeRepo:     incomeRepo,
		incomeTypeRepo: incomeTypeRepo,
	}
}

func NewSuitoScheduleJobService(
	expenseScheduleRepo repositories.ExpenseScheduleRepository,
	expenseRepo repositories.ExpenseRepository,
	incomeScheduleRepo repositories.IncomeScheduleRepository,
	incomeRepo repositories.IncomeRepository,
	transactionProvider transaction.Provider,
) *SuitoScheduleJobService {
	return &SuitoScheduleJobService{
		expenseScheduleRepo: expenseScheduleRepo,
		expenseRepo:         expenseRepo,
		incomeScheduleRepo:  incomeScheduleRepo,
		incomeRepo:          incomeRepo,
		Provider:            transactionProvider,
	}
}

func NewSuitoTransactionScheduleService(
	expenseScheduleRepo repositories.ExpenseScheduleRepository,
	incomeScheduleRepo repositories.IncomeScheduleRepository,
) *SuitoTransactionScheduleService {
	return &SuitoTransactionScheduleService{
		expenseScheduleRepo: expenseScheduleRepo,
		incomeScheduleRepo:  incomeScheduleRepo,
	}
}
