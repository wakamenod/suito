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

func TestTransactionSchedulesHandler(t *testing.T) {
	// Setup
	e := echo.New()
	req := httptest.NewRequest(http.MethodGet, "/schedules", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, sCon.TransactionSchedulesListHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res ListTransactionSchedulesRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
	{
		resExpenses := res.ExpenseSchedules
		require.Equal(t, 2, len(resExpenses))
		require.Equal(t, "Title Expense 1", resExpenses[0].Title)
		require.Equal(t, 100, resExpenses[0].Amount)
		require.Equal(t, "Title Expense 2", resExpenses[1].Title)
		require.Equal(t, 200, resExpenses[1].Amount)
	}
	{
		resIncomes := res.IncomeSchedules
		require.Equal(t, 2, len(resIncomes))
		require.Equal(t, "Test Income Type 01", resIncomes[0].Title)
		require.Equal(t, 300, resIncomes[0].Amount)
		require.Equal(t, "Test Income Type 02", resIncomes[1].Title)
		require.Equal(t, 400, resIncomes[1].Amount)
	}
}
