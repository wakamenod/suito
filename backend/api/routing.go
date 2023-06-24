package api

import (
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/spf13/viper"
	"github.com/wakamenod/suito/api/controllers"
	"github.com/wakamenod/suito/api/repositories"
	"github.com/wakamenod/suito/api/services"
	"github.com/wakamenod/suito/env"
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
	sCon := controllers.NewTransactionScheduleController(ser)
	esCon := controllers.NewExpenseScheduleController(ser)
	isCon := controllers.NewIncomeScheduleController(ser)
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
	{
		a := g.Group("/schedules")
		a.GET("", sCon.TransactionSchedulesListHandler)
	}
	{
		a := g.Group("/expense-schedule")
		a.GET("/detail", esCon.ExpenseScheduleDetailHandler)
		a.PUT("", esCon.UpdateExpenseScheduleHandler)
	}
	{
		a := g.Group("/income-schedule")
		a.GET("/detail", isCon.IncomeScheduleDetailHandler)
		a.PUT("", isCon.UpdateIncomeScheduleHandler)
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
