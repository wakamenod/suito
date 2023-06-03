package transactions

import (
	"github.com/labstack/echo/v4"
)

func InitRoute(g *echo.Group) *echo.Group {
	a := g.Group("/transactions")

	a.GET("", list)

	return a
}
