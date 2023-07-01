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

func TestIncomeTypesHandler(t *testing.T) {
	// Setup
	e := echo.New()
	req := httptest.NewRequest(http.MethodGet, "/types", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, incomeTypeCon.IncomeTypesHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res ListIncomeTypesRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
	require.Equal(t, 2, len(res.IncomeTypes))
	require.Equal(t, "ID_INCOME_TYPE_01", res.IncomeTypes[0].ID)
	require.Equal(t, "ID_INCOME_TYPE_02", res.IncomeTypes[1].ID)
}

func TestRegisterIncomeTypeHandler_ValidationError(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	req := httptest.NewRequest(http.MethodPost, "/types", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	err := incomeTypeCon.RegisterIncomeTypeHandler(c)
	var appErr *apperrors.SuitoError
	require.ErrorAs(t, err, &appErr)
	require.Equal(t, apperrors.InvalidParameter, appErr.ErrCode)
}

func TestRegisterIncomeTypeHandler_Success(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	jsonReq, err := json.Marshal(RegisterIncomeTypeReq{
		IncomeType: model.IncomeType{
			Name: "TestIncomeType",
		}})
	require.NoError(t, err)
	req := httptest.NewRequest(http.MethodPost, "/types", bytes.NewReader(jsonReq))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, incomeTypeCon.RegisterIncomeTypeHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res RegisterIncomeTypeRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
	require.Equal(t, "TEST_NEW_INCOME_TYPE_ID", res.NewIncomeType.ID)
	require.Equal(t, "TestIncomeType", res.NewIncomeType.Name)
}

func TestUpdateIncomeTypeHandler_ValidationError(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	req := httptest.NewRequest(http.MethodPut, "/types", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	err := incomeTypeCon.UpdateIncomeTypeHandler(c)
	var appErr *apperrors.SuitoError
	require.ErrorAs(t, err, &appErr)
	require.Equal(t, apperrors.InvalidParameter, appErr.ErrCode)
}

func TestUpdateIncomeTypeHandler_Success(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	jsonReq, err := json.Marshal(UpdateIncomeTypeReq{
		IncomeType: model.IncomeType{
			ID:   "incomeTypeID",
			Name: "TestIncomeType",
		}})
	require.NoError(t, err)
	req := httptest.NewRequest(http.MethodPut, "/types", bytes.NewReader(jsonReq))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, incomeTypeCon.UpdateIncomeTypeHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res UpdateIncomeTypeRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
	require.Equal(t, "incomeTypeID", res.UpdatedIncomeType.ID)
	require.Equal(t, "TestIncomeType", res.UpdatedIncomeType.Name)
}

func TestDeleteIncomeTypeHandler_Success(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	jsonReq, err := json.Marshal(DeleteIncomeTypeReq{
		IncomeTypeID: "incomeType_id",
	})
	require.NoError(t, err)
	req := httptest.NewRequest(http.MethodDelete, "/", bytes.NewReader(jsonReq))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, incomeTypeCon.DeleteIncomeTypeHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res DeleteIncomeTypeRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
}
