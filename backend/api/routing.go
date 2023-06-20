package api

import (
	"github.com/labstack/echo/v4"
	"github.com/spf13/viper"
	"github.com/wakamenod/suito/api/controllers"
	"github.com/wakamenod/suito/api/repositories"
	"github.com/wakamenod/suito/api/services"
	"gorm.io/gorm"
)

func InitRoute(e *echo.Echo, db *gorm.DB) *echo.Echo {
	e = defaultRoute(e)
	apiBasePath := viper.GetString("server.api_base_path")
	g := e.Group(apiBasePath)

	repo := repositories.NewSuitoRepository(db)
	ser := services.NewSuitoService(repo)
	tCon := controllers.NewTransactionController(ser)
	iCon := controllers.NewIncomeController(ser)
	eCon := controllers.NewExpenseController(ser)
	cCon := controllers.NewChartController(ser)

	{
		a := g.Group("/transactions")
		a.GET("", tCon.TransactionsListHandler)
		a.GET("/months", tCon.TransactionMonthsHandler)
	}
	{
		a := g.Group("/expense")
		a.POST("/detail", eCon.ExpenseDetailHandler)
		a.GET("/categories", eCon.ExpenseCategoriesHandler)
		a.GET("/locations", eCon.ExpenseLocationsHandler)
		a.POST("", eCon.RegisterExpenseHandler)
		a.PUT("", eCon.UpdateExpenseHandler)
		a.DELETE("", eCon.DeleteExpenseHandler)
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
	return e
}

func init() {
	viper.SetDefault("server.api_base_path", "/api/v1")
}
