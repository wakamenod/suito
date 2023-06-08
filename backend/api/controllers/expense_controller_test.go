package controllers

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/labstack/echo/v4"
	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/middleware"
)

func TestExpenseCategoriesHandler(t *testing.T) {
	// Setup
	e := echo.New()
	req := httptest.NewRequest(http.MethodGet, "/categories", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, eCon.ExpenseCategoriesHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res ListExpenseCategoriesRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
	require.Equal(t, 2, len(res.ExpenseCategories))
	require.Equal(t, "ID_EXPENSE_CATEGORY_01", res.ExpenseCategories[0].ID)
	require.Equal(t, "ID_EXPENSE_CATEGORY_02", res.ExpenseCategories[1].ID)
}
