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

func TestColumnChartController(t *testing.T) {
	// Setup
	e := echo.New()
	req := httptest.NewRequest(http.MethodGet, "/chart", nil)
	rec := httptest.NewRecorder()
	c := e.NewContext(req, rec)
	c.Set(middleware.UIDKey, "user1")

	// Assertions
	require.NoError(t, cCon.ColumnChartHandler(c))
	require.Equal(t, http.StatusOK, rec.Code)

	var res GetColumnChartDataRes
	require.NoError(t, json.Unmarshal(rec.Body.Bytes(), &res))
	require.Equal(t, 2, len(res.ExpenseData))
	require.Equal(t, 1, len(res.IncomeData))

	{
		categoryData := res.ExpenseData[0]
		require.Equal(t, "Food", categoryData.CategoryName)
		require.Equal(t, 3, len(categoryData.ColumnChartData))
		require.EqualValues(t, 1000, *categoryData.ColumnChartData[0].Amount)
		require.Equal(t, "2023-05", categoryData.ColumnChartData[0].Month)
		require.EqualValues(t, 2000, *categoryData.ColumnChartData[1].Amount)
		require.Equal(t, "2023-06", categoryData.ColumnChartData[1].Month)
		require.Nil(t, categoryData.ColumnChartData[2].Amount)
		require.Equal(t, "2023-07", categoryData.ColumnChartData[2].Month)
	}
	{
		categoryData := res.ExpenseData[1]
		require.Equal(t, "Car", categoryData.CategoryName)
		require.Equal(t, 3, len(categoryData.ColumnChartData))
		require.EqualValues(t, 3000, *categoryData.ColumnChartData[0].Amount)
		require.Equal(t, "2023-05", categoryData.ColumnChartData[0].Month)
		require.Nil(t, categoryData.ColumnChartData[1].Amount)
		require.Equal(t, "2023-06", categoryData.ColumnChartData[1].Month)
		require.Nil(t, categoryData.ColumnChartData[2].Amount)
		require.Equal(t, "2023-07", categoryData.ColumnChartData[2].Month)
	}
	{
		categoryData := res.IncomeData[0]
		require.Equal(t, "Salary", categoryData.CategoryName)
		require.Equal(t, 3, len(categoryData.ColumnChartData))
		require.EqualValues(t, 3000, *categoryData.ColumnChartData[0].Amount)
		require.Equal(t, "2023-05", categoryData.ColumnChartData[0].Month)
		require.Nil(t, categoryData.ColumnChartData[1].Amount)
		require.Equal(t, "2023-06", categoryData.ColumnChartData[1].Month)
		require.EqualValues(t, 2000, *categoryData.ColumnChartData[2].Amount)
		require.Equal(t, "2023-07", categoryData.ColumnChartData[2].Month)
	}
}
