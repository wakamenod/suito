package services

import (
	"testing"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/api/repositories"
)

func TestGetAllMonths(t *testing.T) {
	expense := []repositories.ColumnChartData{
		{
			CategoryName: "Food",
			Amount:       200,
			Month:        "2023-05",
		},
		{
			CategoryName: "Food",
			Amount:       200,
			Month:        "2023-06",
		},
		{
			CategoryName: "",
			Amount:       400,
			Month:        "2023-05",
		},
	}
	income := []repositories.ColumnChartData{
		{
			CategoryName: "Salary",
			Amount:       200,
			Month:        "2023-05",
		},
		{
			CategoryName: "Salary",
			Amount:       200,
			Month:        "2023-06",
		},
		{
			CategoryName: "",
			Amount:       400,
			Month:        "2023-05",
		},
		{
			CategoryName: "",
			Amount:       400,
			Month:        "2019-05",
		},
	}
	res := getAllMonths(expense, income)
	require.Equal(t, 3, len(res))
	require.Equal(t, "2019-05", res[0])
	require.Equal(t, "2023-05", res[1])
	require.Equal(t, "2023-06", res[2])
}

func TestGroupByCategory(t *testing.T) {
	expense := []repositories.ColumnChartData{
		{
			CategoryName: "Food",
			Amount:       200,
			Month:        "2023-05",
		},
		{
			CategoryName: "Food",
			Amount:       200,
			Month:        "2023-06",
		},
		{
			CategoryName: "",
			Amount:       400,
			Month:        "2023-04",
		},
	}
	res := groupByCategory(expense, []string{"2023-04", "2023-05", "2023-06"})
	require.Equal(t, 2, len(res))
	{
		categoryData := res[0]
		require.Equal(t, "Food", categoryData.CategoryName)
		require.Equal(t, 3, len(categoryData.ColumnChartData))
		require.Nil(t, categoryData.ColumnChartData[0].Amount)
		require.Equal(t, "2023-04", categoryData.ColumnChartData[0].Month)
		require.EqualValues(t, 200, *categoryData.ColumnChartData[1].Amount)
		require.Equal(t, "2023-05", categoryData.ColumnChartData[1].Month)
		require.EqualValues(t, 200, *categoryData.ColumnChartData[2].Amount)
		require.Equal(t, "2023-06", categoryData.ColumnChartData[2].Month)
	}
	{
		categoryData := res[1]
		require.Equal(t, "", categoryData.CategoryName)
		require.Equal(t, 3, len(categoryData.ColumnChartData))
		require.EqualValues(t, 400, *categoryData.ColumnChartData[0].Amount)
		require.Equal(t, "2023-04", categoryData.ColumnChartData[0].Month)
		require.Nil(t, categoryData.ColumnChartData[1].Amount)
		require.Equal(t, "2023-05", categoryData.ColumnChartData[1].Month)
		require.Nil(t, categoryData.ColumnChartData[2].Amount)
		require.Equal(t, "2023-06", categoryData.ColumnChartData[2].Month)
	}
}
