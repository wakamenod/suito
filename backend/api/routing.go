package api

import (
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/spf13/viper"
	"github.com/wakamenod/suito/api/controllers"
	"github.com/wakamenod/suito/api/repositories"
	"github.com/wakamenod/suito/api/services"
	"github.com/wakamenod/suito/db/transaction"
	"github.com/wakamenod/suito/env"
	"gorm.io/gorm"
)

func InitRoute(e *echo.Echo, db *gorm.DB) *echo.Echo {
	e = defaultRoute(e)
	apiBasePath := viper.GetString("server.api_base_path")
	g := e.Group(apiBasePath)

	// repo := repositories.NewSuitoRepository(db)
	categoryRepo := repositories.NewSuitoExpenseCategoryRepository(db)
	locationRepo := repositories.NewSuitoExpenseLocationRepository(db)
	expenseRepo := repositories.NewSuitoExpenseRepository(db)
	expenseScheduleRepo := repositories.NewSuitoExpenseScheduleRepository(db)
	incomeRepo := repositories.NewSuitoIncomeRepository(db)
	incomeScheduleRepo := repositories.NewSuitoIncomeScheduleRepository(db)
	incomeTypeRepo := repositories.NewSuitoIncomeTypeRepository(db)
	transactionMonthsRepo := repositories.NewSuitoTransactionMonthsRepository(db)
	transactionProvider := transaction.NewSuitoTransactionProvider(db)

	transactionSer := services.NewSuitoTransactionService(expenseRepo, incomeRepo, transactionMonthsRepo)
	incomeSer := services.NewSuitoIncomeService(incomeRepo, incomeTypeRepo)
	expenseSer := services.NewSuitoExpenseService(expenseRepo, categoryRepo, locationRepo)
	expenseCategorySer := services.NewSuitoExpenseCategoryService(categoryRepo)
	expenseLocationSer := services.NewSuitoExpenseLocationService(locationRepo)
	chartSer := services.NewSuitoChartService(expenseRepo, incomeRepo)
	transactionScheduleSer := services.NewSuitoTransactionScheduleService(expenseScheduleRepo, incomeScheduleRepo)
	expenseScheduleSer := services.NewSuitoExpenseScheduleService(expenseScheduleRepo, transactionProvider)
	incomeScheduleSer := services.NewSuitoIncomeScheduleService(incomeScheduleRepo, transactionProvider)

	tCon := controllers.NewTransactionController(transactionSer)
	iCon := controllers.NewIncomeController(incomeSer)
	eCon := controllers.NewExpenseController(expenseSer)
	cCon := controllers.NewChartController(chartSer)
	sCon := controllers.NewTransactionScheduleController(transactionScheduleSer)
	esCon := controllers.NewExpenseScheduleController(expenseScheduleSer)
	isCon := controllers.NewIncomeScheduleController(incomeScheduleSer)
	categoryCon := controllers.NewExpenseCategoryController(expenseCategorySer)
	locationCon := controllers.NewExpenseLocationController(expenseLocationSer)

	{
		a := g.Group("/transactions")
		a.GET("", tCon.TransactionsListHandler)
		a.GET("/months", tCon.TransactionMonthsHandler)
	}
	{
		a := g.Group("/expense")
		a.POST("/detail", eCon.ExpenseDetailHandler)

		a.POST("", eCon.RegisterExpenseHandler)
		a.PUT("", eCon.UpdateExpenseHandler)
		a.DELETE("", eCon.DeleteExpenseHandler)

		{
			c := a.Group("/categoreis")
			c.GET("", categoryCon.ExpenseCategoriesHandler)
			c.POST("", categoryCon.RegisterExpenseCategoryHandler)
			c.PUT("", categoryCon.UpdateExpenseCategoryHandler)
			c.DELETE("", categoryCon.DeleteExpenseCategoryHandler)
		}
		{
			c := a.Group("/locations")
			c.GET("", locationCon.ExpenseLocationsHandler)
			c.POST("", locationCon.RegisterExpenseLocationHandler)
			c.PUT("", locationCon.UpdateExpenseLocationHandler)
			c.DELETE("", locationCon.DeleteExpenseLocationHandler)
		}
	}
	{
		a := g.Group("/income")
		a.POST("/", iCon.RegisterIncomeHandler)
		a.POST("/detail", iCon.IncomeDetailHandler)
		a.GET("/types", iCon.IncomeTypesHandler)
		a.PUT("", iCon.UpdateIncomeHandler)
	}
	{
		a := g.Group("/chart")
		a.GET("/column", cCon.ColumnChartHandler)
		a.GET("/pie", cCon.PieChartHandler)
	}
	{
		a := g.Group("/schedules")
		a.GET("", sCon.TransactionSchedulesListHandler)
	}
	{
		a := g.Group("/expense-schedule")
		a.POST("/detail", esCon.ExpenseScheduleDetailHandler)
		a.PUT("", esCon.UpdateExpenseScheduleHandler)
		a.DELETE("", esCon.DeleteExpenseScheduleHandler)
		a.POST("", esCon.RegisterExpenseScheduleHandler)
	}
	{
		a := g.Group("/income-schedule")
		a.POST("/detail", isCon.IncomeScheduleDetailHandler)
		a.PUT("", isCon.UpdateIncomeScheduleHandler)
		a.DELETE("", isCon.DeleteIncomeScheduleHandler)
		a.POST("", isCon.RegisterIncomeScheduleHandler)
	}
	versionRoute(g)
	return e
}

// @Summary     Version
// @Description Version
// @Tags        suito.default
// @ID          version
// @Produce     plain
// @Success     200 {string} string "version"
// @Router      /version [GET]
func versionRoute(e *echo.Group) {
	e.GET("/version", func(c echo.Context) error {
		return c.String(http.StatusOK, env.Version)
	})
}

func init() {
	viper.SetDefault("server.api_base_path", "/api/v1")
}
