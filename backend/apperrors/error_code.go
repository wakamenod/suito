package apperrors

import "net/http"

type ErrCode string
type errMessage string
type errLogType int

const (
	Unknown          ErrCode = "U000"
	SQLNoRows        ErrCode = "U002"
	DeadlineExceeded ErrCode = "U003"

	InvalidParameter ErrCode = "C001"

	IncomeTypeInUse ErrCode = "R001"

	InvalidIDToken ErrCode = "M001"
)

const (
	messageUnknown          errMessage = "internal process failed"
	messageSQLNoRows        errMessage = "data not found in database"
	messageDeadlineExceeded errMessage = "timeout occurs"
	messageInvalidParameter errMessage = "request parameter is invalid"
	messageInvalidIDToken   errMessage = "firebase idtoken is invalid"
	messageIncomeTypeInUse  errMessage = "income type is in use"
)

const (
	typeWarn                errLogType = 1
	typeError               errLogType = 2
	typeErrorWithRquestInfo errLogType = 3
)

func (code ErrCode) Wrap(err error) error {
	return &SuitoError{ErrCode: code, Err: err}
}

// https://github.com/nishanths/exhaustiveをlinterに設定済み
func (e *ErrCode) statusCode() int {
	switch *e {
	case Unknown:
		return http.StatusInternalServerError
	case DeadlineExceeded:
		return http.StatusGatewayTimeout
	case SQLNoRows:
		return http.StatusNotFound
	case InvalidParameter:
		return http.StatusBadRequest
	case InvalidIDToken:
		return http.StatusForbidden
	case IncomeTypeInUse:
		return http.StatusForbidden
	default:
		return http.StatusInternalServerError
	}
}

func (e *ErrCode) errorMessage() errMessage {
	switch *e {
	case Unknown:
		return messageUnknown
	case DeadlineExceeded:
		return messageDeadlineExceeded
	case SQLNoRows:
		return messageSQLNoRows
	case InvalidParameter:
		return messageInvalidParameter
	case InvalidIDToken:
		return messageInvalidIDToken
	case IncomeTypeInUse:
		return messageIncomeTypeInUse
	default:
		return messageUnknown
	}
}

func (e *ErrCode) errorLogType() errLogType {
	//exhaustive:ignore
	switch *e {
	default:
		return typeErrorWithRquestInfo
	}
}
