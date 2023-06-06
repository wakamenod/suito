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

	{
		a := g.Group("/transactions")
		a.GET("", tCon.TransactionsListHandler)
	}

	return e
}

func init() {
	viper.SetDefault("server.api_base_path", "/api/v1")
}
