package controllers

import (
	"bytes"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/labstack/echo/v4"
	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/apperrors"
	"github.com/wakamenod/suito/middleware"
	"github.com/wakamenod/suito/model"
	"github.com/wakamenod/suito/validate"
	"gorm.io/gorm"
)

func TestIncomeScheduleDetailHandler_ErrorValidate(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	req := httptest.NewRequest(http.MethodPost, "/", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	err := isCon.IncomeScheduleDetailHandler(c)
	var appErr *apperrors.SuitoError
	require.ErrorAs(t, err, &appErr)
	require.Equal(t, apperrors.InvalidParameter, appErr.ErrCode)
}

func TestIncomeScheduleDetailHandler_ErrorNotFound(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	jsonReq, err := json.Marshal(IncomeScheduleDetailReq{
		ID: "ID_INCOME_01",
	})
	require.NoError(t, err)
	req := httptest.NewRequest(http.MethodPost, "/", bytes.NewReader(jsonReq))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user99")

	// Assertions
	err = isCon.IncomeScheduleDetailHandler(c)
	require.ErrorIs(t, err, gorm.ErrRecordNotFound)
}

func TestIncomeScheduleDetailHandler_Success(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	jsonReq, err := json.Marshal(IncomeScheduleDetailReq{
		ID: "INCOME_SCHEDULE_ID1",
	})
	require.NoError(t, err)
	req := httptest.NewRequest(http.MethodPost, "/", bytes.NewReader(jsonReq))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	err = isCon.IncomeScheduleDetailHandler(c)
	require.NoError(t, err)
	require.Equal(t, http.StatusOK, rec.Code)

	// Response
	var res IncomeScheduleDetailRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
	require.Equal(t, "INCOME_SCHEDULE_ID1", res.IncomeSchedule.ID)
	require.Equal(t, "Income Type 1", res.IncomeSchedule.IncomeType.Name)
}

func TestUpdateIncomeScheduleHandler_ErrorValidate(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	req := httptest.NewRequest(http.MethodPut, "/", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	err := isCon.UpdateIncomeScheduleHandler(c)
	var appErr *apperrors.SuitoError
	require.Error(t, err)
	require.ErrorAs(t, err, &appErr)
	require.Equal(t, apperrors.InvalidParameter, appErr.ErrCode)
}

func TestUpdateIncomeScheduleHandler_Success(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	jsonReq, err := json.Marshal(UpdateIncomeScheduleReq{
		IncomeSchedule: model.IncomeSchedule{
			ID:     "update_target_id",
			Amount: 9999,
			IncomeType: model.IncomeType{
				Name: "income title 01",
			},
			Timezone: "Asia/Tokyo",
		}})
	require.NoError(t, err)
	req := httptest.NewRequest(http.MethodPut, "/", bytes.NewReader(jsonReq))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, isCon.UpdateIncomeScheduleHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res UpdateIncomeScheduleRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
}

func TestRegisterIncomeScheduleHandler_ErrorValidate(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	req := httptest.NewRequest(http.MethodPost, "/", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	err := isCon.RegisterIncomeScheduleHandler(c)
	var appErr *apperrors.SuitoError
	require.ErrorAs(t, err, &appErr)
	require.Equal(t, apperrors.InvalidParameter, appErr.ErrCode)
}

func TestRegisterIncomeScheduleHandler_Success(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	jsonReq, err := json.Marshal(RegisterIncomeScheduleReq{
		IncomeSchedule: model.IncomeSchedule{
			Amount: 9999,
			IncomeType: model.IncomeType{
				Name: "new type",
			},
			Timezone: "Asia/Tokyo",
		}})
	require.NoError(t, err)
	req := httptest.NewRequest(http.MethodPost, "/", bytes.NewReader(jsonReq))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, isCon.RegisterIncomeScheduleHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res RegisterIncomeScheduleRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
	require.Equal(t, "new_income_schedule_id", res.NewIncomeSchedule.ID)
	require.Equal(t, "new type", res.NewIncomeSchedule.IncomeType.Name)
	require.Equal(t, "Asia/Tokyo", res.NewIncomeSchedule.Timezone)
	require.Equal(t, 9999, res.NewIncomeSchedule.Amount)
}
