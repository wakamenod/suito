package api

import (
	"net/http"

	// _ "suito/docs"

	"github.com/labstack/echo/v4"
	echoSwagger "github.com/swaggo/echo-swagger"
	"github.com/wakamenod/suito/env"
	//_ "github.com/swaggo/echo-swagger/example/docs"
)

func defaultRoute(e *echo.Echo) *echo.Echo {
	if env.DEBUG {
		g := e.Group("/debug")
		g.GET("/routes", func(c echo.Context) error {
			return c.JSON(http.StatusOK, e.Routes())
		})
		g.GET("/swagger/*", echoSwagger.WrapHandler)
	}

	e = pingRoute(e)
	return e
}

// @Summary     Ping
// @Description Ping
// @Tags        suito.default
// @ID          ping
// @Produce     plain
// @Success     200 {string} string "pong"
// @Router      /ping [GET]
func pingRoute(e *echo.Echo) *echo.Echo {
	e.GET("/ping", func(c echo.Context) error {
		return c.String(http.StatusOK, "pong!\n")
	})
	return e
}
