package testdata

import (
	"time"

	"github.com/wakamenod/suito/model"
)

var expenseTestData = []model.Expense{
	model.Expense{
		ID:                "ID_EXPENSE_01",
		UID:               "user1",
		Title:             "Test001",
		Amount:            100,
		Memo:              "Memo001",
		ExpenseLocationID: "ID_EXPENSE_LOCATION_01",
		ExpenseCategoryID: "ID_EXPENSE_CATEGORY_01",
		LocalDate:         time.Date(2023, time.Month(1), 1, 0, 0, 0, 0, time.UTC),
	},
	model.Expense{
		ID:                "ID_EXPENSE_02",
		UID:               "user1",
		Title:             "Test002",
		Amount:            200,
		Memo:              "Memo001",
		ExpenseLocationID: "ID_EXPENSE_LOCATION_01",
		ExpenseCategoryID: "ID_EXPENSE_CATEGORY_01",
		LocalDate:         time.Date(2023, time.Month(3), 1, 0, 0, 0, 0, time.UTC),
	},
	model.Expense{
		ID:                "ZZZ_ID_EXPENSE_03",
		UID:               "user1",
		Title:             "Test003",
		Amount:            200,
		Memo:              "Memo001",
		ExpenseLocationID: "ID_EXPENSE_LOCATION_01",
		ExpenseCategoryID: "ID_EXPENSE_CATEGORY_01",
		LocalDate:         time.Date(2023, time.Month(4), 1, 0, 0, 0, 0, time.UTC),
	},
}

var incomeTestData = []model.Income{
	model.Income{
		ID:           "ID_INCOME_01",
		UID:          "user1",
		Amount:       100,
		Memo:         "Memo001",
		IncomeTypeID: incomeTypeTestData[0].ID,
		LocalDate:    time.Date(2023, time.Month(2), 1, 0, 0, 0, 0, time.UTC),
	},
	model.Income{
		ID:           "ID_INCOME_02",
		UID:          "user1",
		Amount:       200,
		Memo:         "Memo001",
		IncomeTypeID: incomeTypeTestData[1].ID,
		LocalDate:    time.Date(2023, time.Month(4), 1, 0, 0, 0, 0, time.UTC),
	},
}

var incomeTypeTestData = []model.IncomeType{
	model.IncomeType{
		ID:   "ID_INCOME_TYPE_01",
		UID:  "user1",
		Name: "Test Income Type 01",
	},
	model.IncomeType{
		ID:   "ID_INCOME_TYPE_02",
		UID:  "user1",
		Name: "Test Income Type 02",
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

var expenseSchedulesTestData = []model.ExpenseSchedule{
	{
		ID:                "EXPENSE_SCHEDULE_ID1",
		UID:               "user1",
		Title:             "Title Expense 1",
		Amount:            100,
		ExpenseCategoryID: "TEST_CATEGORY_ID",
		ExpenseLocationID: "TEST_LOCATION_ID",
	},
	{
		ID:     "EXPENSE_SCHEDULE_ID2",
		UID:    "user1",
		Title:  "Title Expense 2",
		Amount: 200,
	},
}

var incomeSchedulesTestData = []model.IncomeSchedule{
	{
		ID:           "INCOME_SCHEDULE_ID1",
		UID:          "user1",
		IncomeTypeID: incomeTypeTestData[0].ID,
		Amount:       300,
	},
	{
		ID:           "INCOME_SCHEDULE_ID2",
		UID:          "user1",
		IncomeTypeID: incomeTypeTestData[1].ID,
		Amount:       400,
	},
}
