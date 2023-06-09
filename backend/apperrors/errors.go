package apperrors

import (
	"context"

	"github.com/labstack/echo/v4"
	"github.com/pkg/errors"
	"github.com/wakamenod/suito/utils/webutils"
	"gorm.io/gorm"
)

type SuitoError struct {
	ErrCode
	Message string
	Err     error `json:"-"`
} // @Name SuitoError

func (myErr *SuitoError) Error() string {
	return myErr.Err.Error()
}

func (myErr *SuitoError) Unwrap() error {
	return myErr.Err
}

func HTTPErrorHandler(err error, c echo.Context) {
	if c.Response().Committed {
		return
	}
	suitoError := handleError(err)

	switch suitoError.errorLogType() {
	case typeWarn:
		c.Logger().Warn(suitoError)
	case typeError:
		c.Logger().Error(suitoError)
	case typeErrorWithRquestInfo:
		errorLogWithRequestInfo(c, suitoError)
	}

	if err := webutils.Response(c, suitoError.statusCode(), suitoError); err != nil {
		c.Logger().Error(err)
	}
}

func handleError(err error) *SuitoError {
	var suitoErr *SuitoError
	if !errors.As(err, &suitoErr) {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			suitoErr = &SuitoError{
				ErrCode: SQLNoRows,
				Err:     err,
			}
		} else if errors.Is(err, context.DeadlineExceeded) {
			suitoErr = &SuitoError{
				ErrCode: DeadlineExceeded,
				Err:     err,
			}
		} else {
			suitoErr = &SuitoError{
				ErrCode: Unknown,
				Err:     err,
			}
		}
	}

	suitoErr.Message = string(suitoErr.ErrCode.errorMessage())
	return suitoErr
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
