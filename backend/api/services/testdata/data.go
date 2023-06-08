package testdata

import (
	"time"

	"github.com/wakamenod/suito/model"
)

var expenseTestData = []model.Expense{
	model.Expense{
		ID:        "ID_EXPENSE_01",
		UID:       "user1",
		Title:     "Test001",
		Amount:    100,
		Memo:      "Memo001",
		LocalDate: time.Date(2023, time.Month(1), 1, 0, 0, 0, 0, time.UTC),
	},
	model.Expense{
		ID:        "ID_EXPENSE_02",
		UID:       "user1",
		Title:     "Test002",
		Amount:    200,
		Memo:      "Memo001",
		LocalDate: time.Date(2023, time.Month(3), 1, 0, 0, 0, 0, time.UTC),
	},
}

var incomeTestData = []model.Income{
	model.Income{
		ID:        "ID_INCOME_01",
		UID:       "user1",
		Title:     "Test001",
		Amount:    100,
		Memo:      "Memo001",
		LocalDate: time.Date(2023, time.Month(2), 1, 0, 0, 0, 0, time.UTC),
	},
	model.Income{
		ID:        "ID_INCOME_02",
		UID:       "user1",
		Title:     "Test002",
		Amount:    200,
		Memo:      "Memo001",
		LocalDate: time.Date(2023, time.Month(4), 1, 0, 0, 0, 0, time.UTC),
	},
}

var expenseCategoryTestData = []model.ExpenseCategory{
	model.ExpenseCategory{
		ID:   "ID_EXPENSE_CATEGORY_01",
		UID:  "user1",
		Name: "Test Category 01",
	},
	model.ExpenseCategory{
		ID:   "ID_EXPENSE_CATEGORY_02",
		UID:  "user1",
		Name: "Test Category 02",
	},
}

var expenseLocationTestData = []model.ExpenseLocation{
	model.ExpenseLocation{
		ID:   "ID_EXPENSE_LOCATION_01",
		UID:  "user1",
		Name: "Test Location 01",
	},
	model.ExpenseLocation{
		ID:   "ID_EXPENSE_LOCATION_02",
		UID:  "user1",
		Name: "Test Location 02",
	},
}
