package api

import (
	"github.com/labstack/echo/v4"
	"github.com/spf13/viper"
)

func InitRoute(e *echo.Echo) *echo.Echo {
	e = defaultRoute(e)
	// apiBasePath := viper.GetString("server.api_base_path")

	// g := e.Group(apiBasePath)

	return e
}

func init() {
	viper.SetDefault("server.api_base_path", "/api/v1")
}
