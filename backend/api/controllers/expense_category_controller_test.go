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

func TestExpenseCategoriesHandler(t *testing.T) {
	// Setup
	e := echo.New()
	req := httptest.NewRequest(http.MethodGet, "/categories", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, categoryCon.ExpenseCategoriesHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res ListExpenseCategoriesRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
	require.Equal(t, 2, len(res.ExpenseCategories))
	require.Equal(t, "ID_EXPENSE_CATEGORY_01", res.ExpenseCategories[0].ID)
	require.Equal(t, "ID_EXPENSE_CATEGORY_02", res.ExpenseCategories[1].ID)
}

func TestRegisterExpenseCategoryHandler_ValidationError(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	req := httptest.NewRequest(http.MethodPost, "/categories", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	err := categoryCon.RegisterExpenseCategoryHandler(c)
	var appErr *apperrors.SuitoError
	require.ErrorAs(t, err, &appErr)
	require.Equal(t, apperrors.InvalidParameter, appErr.ErrCode)
}

func TestRegisterExpenseCategoryHandler_Success(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	jsonReq, err := json.Marshal(RegisterExpenseCategoryReq{
		ExpenseCategory: model.ExpenseCategory{
			Name: "TestCategory",
		}})
	require.NoError(t, err)
	req := httptest.NewRequest(http.MethodPost, "/categories", bytes.NewReader(jsonReq))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, categoryCon.RegisterExpenseCategoryHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res RegisterExpenseCategoryRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
	require.Equal(t, "TEST_NEW_CATEGORY_ID", res.NewExpenseCategory.ID)
	require.Equal(t, "TestCategory", res.NewExpenseCategory.Name)
}

func TestUpdateExpenseCategoryHandler_ValidationError(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	req := httptest.NewRequest(http.MethodPut, "/categories", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	err := categoryCon.UpdateExpenseCategoryHandler(c)
	var appErr *apperrors.SuitoError
	require.ErrorAs(t, err, &appErr)
	require.Equal(t, apperrors.InvalidParameter, appErr.ErrCode)
}

func TestUpdateExpenseCategoryHandler_Success(t *testing.T) {
	// Setup
	e := echo.New()
	e.Validator = validate.NewValidator()
	jsonReq, err := json.Marshal(UpdateExpenseCategoryReq{
		ExpenseCategory: model.ExpenseCategory{
			ID:   "categoryID",
			Name: "TestCategory",
		}})
	require.NoError(t, err)
	req := httptest.NewRequest(http.MethodPut, "/categories", bytes.NewReader(jsonReq))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, categoryCon.UpdateExpenseCategoryHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res UpdateExpenseCategoryRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
	require.Equal(t, "categoryID", res.UpdatedExpenseCategory.ID)
	require.Equal(t, "TestCategory", res.UpdatedExpenseCategory.Name)
}
