package jobs

import (
	"github.com/wakamenod/suito/api/repositories"
	"github.com/wakamenod/suito/api/services"
	"github.com/wakamenod/suito/client"
	"github.com/wakamenod/suito/db/transaction"
	"gorm.io/gorm"
)

func ScheduleAllJobs(authClient client.AuthClient, db *gorm.DB) error {
	categoryRepo := repositories.NewSuitoExpenseCategoryRepository(db)
	locationRepo := repositories.NewSuitoExpenseLocationRepository(db)
	expenseRepo := repositories.NewSuitoExpenseRepository(db)
	expenseScheduleRepo := repositories.NewSuitoExpenseScheduleRepository(db)
	incomeRepo := repositories.NewSuitoIncomeRepository(db)
	incomeScheduleRepo := repositories.NewSuitoIncomeScheduleRepository(db)
	userRepo := repositories.NewSuitoUserRepository(db)
	transactionProvider := transaction.NewSuitoTransactionProvider(db)

	deleteUserService := services.NewSuitoDeleteUserJobService(categoryRepo, locationRepo, expenseRepo, incomeRepo, userRepo, transactionProvider, authClient)
	scheduleService := services.NewSuitoScheduleJobService(expenseScheduleRepo, expenseRepo, incomeScheduleRepo, incomeRepo, transactionProvider)

	if err := scheduleDeleteUserJob(deleteUserService); err != nil {
		return err
	}
	if err := scheduleCreateTransactionsJob(scheduleService); err != nil {
		return err
	}
	if err := scheduleEnqueueTransactionScheduleJob(scheduleService); err != nil {
		return err
	}
	return nil
}
