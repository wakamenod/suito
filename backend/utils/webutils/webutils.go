package webutils

import (
	"github.com/labstack/echo/v4"
)

func Response(c echo.Context, code int, i any) error {
	return c.JSON(code, i)
}
