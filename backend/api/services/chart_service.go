package services

import (
	"sort"

	"github.com/wakamenod/suito/api/repositories"
)

type (
	ColumnChartData struct {
		Amount *int64
		Month  string
	}

	ColumnChartCategoryData struct {
		CategoryName    string
		ColumnChartData []ColumnChartData
	}
)

func (s *SuitoService) ColumnChartService(uid string) ([]ColumnChartCategoryData, []ColumnChartCategoryData, error) {
	expenseData, err := s.repo.FindColumnChartExpenseData(uid)
	if err != nil {
		return nil, nil, err
	}
	incomeData, err := s.repo.FindColumnChartIncomeData(uid)
	if err != nil {
		return nil, nil, err
	}
	allMonths := getAllMonths(expenseData, incomeData)

	expenseRes := groupByCategory(expenseData, allMonths)
	incomeRes := groupByCategory(incomeData, allMonths)
	return expenseRes, incomeRes, nil
}

func getAllMonths(expense, income []repositories.ColumnChartData) []string {
	monthsMap := make(map[string]bool)
	for _, e := range expense {
		monthsMap[e.Month] = true
	}
	for _, i := range income {
		monthsMap[i.Month] = true
	}
	res := make([]string, 0)
	for k := range monthsMap {
		res = append(res, k)
	}
	sort.SliceStable(res, func(i, j int) bool { return res[i] < res[j] })
	return res
}

func groupByCategory(data []repositories.ColumnChartData, months []string) []ColumnChartCategoryData {
	categoryMap := make(map[string]map[string]repositories.ColumnChartData)
	for _, d := range data {
		if _, ok := categoryMap[d.CategoryName]; !ok {
			categoryMap[d.CategoryName] = make(map[string]repositories.ColumnChartData)
		}
		categoryMap[d.CategoryName][d.Month] = d
	}

	var res []ColumnChartCategoryData
	for category, mp := range categoryMap {
		monthData := make([]ColumnChartData, len(months))
		for i, month := range months {
			if m, ok := mp[month]; ok {
				monthData[i] = ColumnChartData{Month: month, Amount: &m.Amount}
			} else {
				monthData[i] = ColumnChartData{Month: month, Amount: nil}
			}
		}
		res = append(res, ColumnChartCategoryData{
			CategoryName:    category,
			ColumnChartData: monthData,
		})
	}
	sort.SliceStable(res, func(i, j int) bool { return res[i].CategoryName > res[j].CategoryName })
	return res
}
