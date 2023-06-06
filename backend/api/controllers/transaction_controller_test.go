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

func TestTransactionsListHandler(t *testing.T) {
	// Setup
	e := echo.New()
	req := httptest.NewRequest(http.MethodGet, "/?yearMonth=2023-05", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, tCon.TransactionsListHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res ListTransactionsRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
	require.Equal(t, 4, len(res.Transactions))
	require.Equal(t, "ID_INCOME_02", res.Transactions[0].ID)
	require.Equal(t, "ID_EXPENSE_02", res.Transactions[1].ID)
	require.Equal(t, "ID_INCOME_01", res.Transactions[2].ID)
	require.Equal(t, "ID_EXPENSE_01", res.Transactions[3].ID)
}
