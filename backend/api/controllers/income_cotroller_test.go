package controllers

import (
	"bytes"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"
	"time"

	"github.com/labstack/echo/v4"
	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/apperrors"
	"github.com/wakamenod/suito/middleware"
	"github.com/wakamenod/suito/model"
	"github.com/wakamenod/suito/validate"
)

func TestRegisterIncomeHandler_ErrorValidate(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	req := httptest.NewRequest(http.MethodPost, "/", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	err := iCon.RegisterIncomeHandler(c)
	var appErr *apperrors.SuitoError
	require.ErrorAs(t, err, &appErr)
	require.Equal(t, apperrors.InvalidParameter, appErr.ErrCode)
}

func TestRegisterIncomeHandler_Success(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	jsonReq, err := json.Marshal(RegisterIncomeReq{
		Income: model.Income{
			Title:     "testTitle",
			Amount:    9999,
			LocalDate: time.Date(2023, 5, 4, 0, 0, 0, 0, time.UTC),
		}})
	require.NoError(t, err)
	req := httptest.NewRequest(http.MethodPost, "/", bytes.NewReader(jsonReq))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, iCon.RegisterIncomeHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res RegisterIncomeRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
}