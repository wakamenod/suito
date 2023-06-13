package middleware

import (
	"fmt"
	"strconv"
	"time"

	"github.com/labstack/echo/v4"
	"github.com/wakamenod/suito/env"
	"github.com/wakamenod/suito/log"
)

const (
	ReqBodyLogKey = "reqBodyLogKey"
	ResBodyLogKey = "resBodyLogKey"
)

func logMiddlewareHandler(c echo.Context, next echo.HandlerFunc) error {
	req := c.Request()
	res := c.Response()
	start := time.Now()

	if err := next(c); err != nil {
		c.Error(err)
	}
	stop := time.Now()

	log.Info("accesslog", log.Fields{
		"remoteIp":  c.RealIP(),
		"path":      req.URL.Path,
		"userAgent": req.UserAgent(),
		"status":    res.Status,
		"latency":   strconv.FormatInt(stop.Sub(start).Nanoseconds()/1000, 10),
		"method":    c.Request().Method,
	})

	if env.DEBUG {
		// nolint
		fmt.Printf("%v\n", c.Get(ReqBodyLogKey))
		// nolint
		fmt.Printf("%v\n", c.Get(ResBodyLogKey))
	}

	return nil
}

func logger(next echo.HandlerFunc) echo.HandlerFunc {
	return func(c echo.Context) error {
		return logMiddlewareHandler(c, next)
	}
}

func Logger() echo.MiddlewareFunc {
	return logger
}
