package errors

import (
	"context"
	"database/sql"
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/pkg/errors"
	"github.com/wakamenod/suito/utils/webutils"
)

var (
	ErrConnectionRefuse = errors.New("connection refused")
	ErrForbidden        = errors.New("access denied")
	ErrInvalidIDToken   = errors.New("invalid idToken")
)

type APIError struct {
	Message string `json:"message"`
}

type ErrorBuilder interface {
	NewError(msg string) interface{}
}

type logFunc func(echo.Context, error)

func NewAPIError(msg string) interface{} {
	return APIError{
		Message: msg,
	}
}

func HTTPErrorHandler(err error, c echo.Context) {
	if c.Response().Committed {
		return
	}
	statusCode, errRes, log := handleError(err)

	log(c, err)

	if err := webutils.Response(c, statusCode, errRes); err != nil {
		c.Logger().Error(err)
	}
}

func handleError(err error) (int, any, logFunc) {
	errRes := NewAPIError(err.Error())

	switch cause := errors.Cause(err); {
	case cause == ErrForbidden || cause == ErrInvalidIDToken:
		return http.StatusForbidden, errRes, warnLog
	case cause == ErrConnectionRefuse:
		return http.StatusInternalServerError, errRes, errorLogWithRequestInfo
	case cause == sql.ErrNoRows:
		return http.StatusNotFound, errRes, errorLogWithRequestInfo
	case cause == context.DeadlineExceeded:
		return http.StatusGatewayTimeout, errRes, errorLogWithRequestInfo
	default:
		switch v := err.(type) {
		case *echo.HTTPError:
			return v.Code, v.Message, errorLogWithRequestInfo
		}
	}

	return http.StatusInternalServerError, errRes, errorLog
}

func warnLog(c echo.Context, err error) {
	c.Logger().Warn(err)
}

func errorLog(c echo.Context, err error) {
	c.Logger().Error(err)
}

func errorLogWithRequestInfo(c echo.Context, err error) {
	req := c.Request()
	urlPath := req.URL.Path
	ip := c.RealIP()
	ua := req.UserAgent()
	msg := err.Error()

	newError := errors.New(msg + ", path:" + urlPath + ", remoteIp:" + ip + ", userAgent:" + ua)

	c.Logger().Error(newError)
}
