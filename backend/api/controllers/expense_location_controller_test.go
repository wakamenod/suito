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
)

func TestExpenseLocationsHandler(t *testing.T) {
	// Setup
	e := echo.New()
	req := httptest.NewRequest(http.MethodGet, "/locations", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, locationCon.ExpenseLocationsHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res ListExpenseLocationsRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
	require.Equal(t, 2, len(res.ExpenseLocations))
	require.Equal(t, "ID_EXPENSE_LOCATION_01", res.ExpenseLocations[0].ID)
	require.Equal(t, "ID_EXPENSE_LOCATION_02", res.ExpenseLocations[1].ID)
}

func TestRegisterExpenseLocationHandler_ValidationError(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	req := httptest.NewRequest(http.MethodPost, "/categories", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	err := locationCon.RegisterExpenseLocationHandler(c)
	var appErr *apperrors.SuitoError
	require.ErrorAs(t, err, &appErr)
	require.Equal(t, apperrors.InvalidParameter, appErr.ErrCode)
}

func TestRegisterExpenseLocationHandler_Success(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	jsonReq, err := json.Marshal(RegisterExpenseLocationReq{
		ExpenseLocation: model.ExpenseLocation{
			Name: "TestLocation",
		}})
	require.NoError(t, err)
	req := httptest.NewRequest(http.MethodPost, "/categories", bytes.NewReader(jsonReq))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, locationCon.RegisterExpenseLocationHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res RegisterExpenseLocationRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
	require.Equal(t, "TEST_NEW_LOCATION_ID", res.NewExpenseLocation.ID)
	require.Equal(t, "TestLocation", res.NewExpenseLocation.Name)
}

func TestDeleteExpenseLocationHandler_ErrorValidate(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	req := httptest.NewRequest(http.MethodDelete, "/", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	err := locationCon.DeleteExpenseLocationHandler(c)
	var appErr *apperrors.SuitoError
	require.ErrorAs(t, err, &appErr)
	require.Equal(t, apperrors.InvalidParameter, appErr.ErrCode)
}

func TestDeleteExpenseLocationHandler_Success(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	jsonReq, err := json.Marshal(DeleteExpenseLocationReq{
		ExpenseLocationID: "expenseLocation_id",
	})
	require.NoError(t, err)
	req := httptest.NewRequest(http.MethodDelete, "/", bytes.NewReader(jsonReq))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, locationCon.DeleteExpenseLocationHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res DeleteExpenseLocationRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
}

func TestUpdateExpenseLocationHandler_ValidationError(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	req := httptest.NewRequest(http.MethodPut, "/categories", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	err := locationCon.UpdateExpenseLocationHandler(c)
	var appErr *apperrors.SuitoError
	require.ErrorAs(t, err, &appErr)
	require.Equal(t, apperrors.InvalidParameter, appErr.ErrCode)
}

func TestUpdateExpenseLocationHandler_Success(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	jsonReq, err := json.Marshal(UpdateExpenseLocationReq{
		ExpenseLocation: model.ExpenseLocation{
			ID:   "locationID",
			Name: "TestLocation",
		}})
	require.NoError(t, err)
	req := httptest.NewRequest(http.MethodPut, "/categories", bytes.NewReader(jsonReq))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, locationCon.UpdateExpenseLocationHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res UpdateExpenseLocationRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
	require.Equal(t, "locationID", res.UpdatedExpenseLocation.ID)
	require.Equal(t, "TestLocation", res.UpdatedExpenseLocation.Name)
}
