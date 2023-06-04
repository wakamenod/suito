package webutils

import (

	//#nosec
	"encoding/json"
	"io"

	"github.com/labstack/echo/v4"
	"github.com/pkg/errors"
)

const (
	JSONMimeType = "application/json"
)

type ErrorBuilder func(msg string) interface{}

type JSONBinder struct {
	ErrorBuilder ErrorBuilder
}

type ErrorRes struct {
	ErrorInfo *ErrorInfo `json:"errorInfo"`
} //@name APIErrorRes

type ErrorInfo struct {
	Code    string `json:"code"`
	Message string `json:"message"`
	Data    string `json:"data"`
	Status  int    `json:"-"`
} //@name APIErrorInfo

func (e *ErrorInfo) Error() string {
	return e.Message
}

func NewErrorInfo(code, message string, status int) *ErrorInfo {
	return &ErrorInfo{Code: code, Message: message, Status: status}
}

func (jb *JSONBinder) Bind(i interface{}, c echo.Context) error {
	r := c.Request()
	b, err := io.ReadAll(r.Body)
	if err != nil {
		return errors.Wrap(err, "failed read body")
	}

	if err := json.Unmarshal(b, i); err != nil {
		return errors.Wrap(err, "failed json unmarshal")
	}

	return nil
}

func (jb *JSONBinder) NewError(msg string) interface{} {
	return jb.ErrorBuilder(msg)
}

func Response(c echo.Context, code int, i interface{}) error {
	return c.JSON(code, i)
}

func Err(c echo.Context, err error) error {
	switch e := err.(type) {
	case *ErrorInfo:
		return Response(c, e.Status, ErrorRes{ErrorInfo: e})
	default:
		return err
	}
}
