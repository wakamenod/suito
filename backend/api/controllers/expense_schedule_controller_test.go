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

func TestExpenseScheduleDetailHandler_ErrorValidate(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	req := httptest.NewRequest(http.MethodPost, "/", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	err := esCon.ExpenseScheduleDetailHandler(c)
	var appErr *apperrors.SuitoError
	require.ErrorAs(t, err, &appErr)
	require.Equal(t, apperrors.InvalidParameter, appErr.ErrCode)
}

func TestExpenseScheduleDetailHandler_ErrorNotFound(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	jsonReq, err := json.Marshal(ExpenseScheduleDetailReq{
		ID: "ID_EXPENSE_01",
	})
	require.NoError(t, err)
	req := httptest.NewRequest(http.MethodPost, "/", bytes.NewReader(jsonReq))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user99")

	// Assertions
	err = esCon.ExpenseScheduleDetailHandler(c)
	require.ErrorIs(t, err, gorm.ErrRecordNotFound)
}

func TestExpenseScheduleDetailHandler_Success(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	jsonReq, err := json.Marshal(ExpenseScheduleDetailReq{
		ID: "EXPENSE_SCHEDULE_ID1",
	})
	require.NoError(t, err)
	req := httptest.NewRequest(http.MethodPost, "/", bytes.NewReader(jsonReq))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	err = esCon.ExpenseScheduleDetailHandler(c)
	require.NoError(t, err)
	require.Equal(t, http.StatusOK, rec.Code)

	// Response
	var res ExpenseScheduleDetailRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
	require.Equal(t, "EXPENSE_SCHEDULE_ID1", res.ExpenseSchedule.ID)
	require.Equal(t, "Test Category", res.ExpenseSchedule.ExpenseCategory.Name)
	require.Equal(t, "Test Location", res.ExpenseSchedule.ExpenseLocation.Name)
}

func TestUpdateExpenseScheduleHandler_ErrorValidate(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	req := httptest.NewRequest(http.MethodPut, "/", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	err := esCon.UpdateExpenseScheduleHandler(c)
	var appErr *apperrors.SuitoError
	require.Error(t, err)
	require.ErrorAs(t, err, &appErr)
	require.Equal(t, apperrors.InvalidParameter, appErr.ErrCode)
}

func TestUpdateExpenseScheduleHandler_Success(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	jsonReq, err := json.Marshal(UpdateExpenseScheduleReq{
		ExpenseSchedule: model.ExpenseSchedule{
			ID:       "update_target_id",
			Title:    "testTitle",
			Amount:   9999,
			Timezone: "Asia/Tokyo",
		}})
	require.NoError(t, err)
	req := httptest.NewRequest(http.MethodPut, "/", bytes.NewReader(jsonReq))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, esCon.UpdateExpenseScheduleHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res UpdateExpenseScheduleRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
}

func TestDeleteExpenseScheduleHandler_ErrorValidate(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	req := httptest.NewRequest(http.MethodDelete, "/", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	err := esCon.DeleteExpenseScheduleHandler(c)
	var appErr *apperrors.SuitoError
	require.ErrorAs(t, err, &appErr)
	require.Equal(t, apperrors.InvalidParameter, appErr.ErrCode)
}

func TestDeleteExpenseScheduleHandler_Success(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	jsonReq, err := json.Marshal(DeleteExpenseScheduleReq{
		ExpenseScheduleID: "expenseSchedule_id",
	})
	require.NoError(t, err)
	req := httptest.NewRequest(http.MethodDelete, "/", bytes.NewReader(jsonReq))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, esCon.DeleteExpenseScheduleHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res DeleteExpenseScheduleRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
}

func TestRegisterExpenseScheduleHandler_ErrorValidate(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	req := httptest.NewRequest(http.MethodPost, "/", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	err := esCon.RegisterExpenseScheduleHandler(c)
	var appErr *apperrors.SuitoError
	require.ErrorAs(t, err, &appErr)
	require.Equal(t, apperrors.InvalidParameter, appErr.ErrCode)
}

func TestRegisterExpenseScheduleHandler_Success(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	jsonReq, err := json.Marshal(RegisterExpenseScheduleReq{
		ExpenseSchedule: model.ExpenseSchedule{
			Title:  "testTitle",
			Amount: 9999,
			ExpenseCategory: model.ExpenseCategory{
				Name: "new category",
			},
			ExpenseLocation: model.ExpenseLocation{
				Name: "new location",
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
	require.NoError(t, esCon.RegisterExpenseScheduleHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res RegisterExpenseScheduleRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
	require.Equal(t, "new_expense_schedule_id", res.NewExpenseSchedule.ID)
	require.Equal(t, "new category", res.NewExpenseSchedule.ExpenseCategory.Name)
	require.Equal(t, "new location", res.NewExpenseSchedule.ExpenseLocation.Name)
	require.Equal(t, "Asia/Tokyo", res.NewExpenseSchedule.Timezone)
	require.Equal(t, 9999, res.NewExpenseSchedule.Amount)
	require.Equal(t, "testTitle", res.NewExpenseSchedule.Title)
}
