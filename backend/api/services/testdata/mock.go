package testdata

import (
	"time"

	"github.com/wakamenod/suito/api/repositories"
	srepositories "github.com/wakamenod/suito/api/services/repositories"
	"github.com/wakamenod/suito/model"
	"gorm.io/gorm"
)

var ExpenseCategoryRepositoryMock = srepositories.ExpenseCategoryRepositoryMock{
	FindExpenseCategoriesFunc: func(uid string) ([]model.ExpenseCategory, error) {
		return expenseCategoryTestData, nil
	},
	FindOrCreateExpenseCategoryFunc: func(uid string, name string) (model.ExpenseCategory, error) {
		return model.ExpenseCategory{ID: "TEST_CATEGORY_ID", Name: name}, nil
	},
	FindExpenseCategoryFunc: func(id string, uid string) (model.ExpenseCategory, error) {
		return model.ExpenseCategory{ID: "TEST_CATEGORY_ID", Name: "Test Category"}, nil
	},
	CreateExpenseCategoryFunc: func(uid string, expense model.ExpenseCategory) (model.ExpenseCategory, error) {
		expense.UID = uid
		expense.ID = "TEST_NEW_CATEGORY_ID"
		return expense, nil
	},
	UpdateExpenseCategoryFunc: func(uid string, expenseCategory model.ExpenseCategory) (model.ExpenseCategory, error) {
		return expenseCategory, nil
	},
	DeleteExpenseCategoryFunc: func(id string, uid string) error {
		return nil
	},
}

var ExpenseLocationRepositoryMock = srepositories.ExpenseLocationRepositoryMock{
	FindExpenseLocationsFunc: func(uid string) ([]model.ExpenseLocation, error) {
		return expenseLocationTestData, nil
	},
	FindOrCreateExpenseLocationFunc: func(uid string, name string) (model.ExpenseLocation, error) {
		return model.ExpenseLocation{ID: "TEST_LOCATION_ID", Name: name}, nil
	},
	CreateExpenseLocationFunc: func(uid string, expense model.ExpenseLocation) (model.ExpenseLocation, error) {
		expense.UID = uid
		expense.ID = "TEST_NEW_LOCATION_ID"
		return expense, nil
	},
	UpdateExpenseLocationFunc: func(uid string, expenseLocation model.ExpenseLocation) (model.ExpenseLocation, error) {
		return expenseLocation, nil
	},
	FindExpenseLocationFunc: func(id string, uid string) (model.ExpenseLocation, error) {
		return model.ExpenseLocation{ID: "TEST_LOCATION_ID", Name: "Test Location"}, nil
	},
	DeleteExpenseLocationFunc: func(id string, uid string) error {
		return nil
	},
}

var ExpenseScheduleRepositoryMock = srepositories.ExpenseScheduleRepositoryMock{
	FindExpenseSchedulesFunc: func(uid string) ([]model.ExpenseSchedule, error) {
		return expenseSchedulesTestData, nil
	},
	FindExpenseScheduleFunc: func(id string, uid string) (model.ExpenseSchedule, error) {
		for _, ex := range expenseSchedulesTestData {
			if id == ex.ID && uid == ex.UID {
				return ex, nil
			}
		}
		return model.ExpenseSchedule{}, gorm.ErrRecordNotFound
	},
	UpdateExpenseScheduleFunc: func(uid string, schedule model.ExpenseSchedule) (model.ExpenseSchedule, error) {
		return schedule, nil
	},
	DeleteExpenseScheduleFunc: func(id string, uid string) error {
		return nil
	},
	CreateExpenseScheduleFunc: func(uid string, expenseSchedule model.ExpenseSchedule) (model.ExpenseSchedule, error) {
		expenseSchedule.ID = "new_expense_schedule_id"
		return expenseSchedule, nil
	},
	EnqueueExpenseScheduleFunc: func() error {
		return nil
	},
}

var IncomeScheduleRepositoryMock = srepositories.IncomeScheduleRepositoryMock{
	FindIncomeSchedulesFunc: func(uid string) ([]model.IncomeSchedule, error) {
		return incomeSchedulesTestData, nil
	},
	FindIncomeScheduleFunc: func(id string, uid string) (model.IncomeSchedule, error) {
		for _, ex := range incomeSchedulesTestData {
			if id == ex.ID && uid == ex.UID {
				return ex, nil
			}
		}
		return model.IncomeSchedule{}, gorm.ErrRecordNotFound
	},
	UpdateIncomeScheduleFunc: func(uid string, schedule model.IncomeSchedule) (model.IncomeSchedule, error) {
		return schedule, nil
	},
	DeleteIncomeScheduleFunc: func(id string, uid string) error {
		return nil
	},

	CreateIncomeScheduleFunc: func(uid string, incomeSchedule model.IncomeSchedule) (model.IncomeSchedule, error) {
		incomeSchedule.ID = "new_income_schedule_id"
		return incomeSchedule, nil
	},

	EnqueueIncomeScheduleFunc: func() error {
		return nil
	},
}

var ExpenseRepositoryMock = srepositories.ExpenseRepositoryMock{
	FindExpensesFunc: func(uid string, start *time.Time, end *time.Time) ([]model.Expense, error) {
		return expenseTestData, nil
	},
	CreateExpenseFunc: func(uid string, expense model.Expense) (model.Expense, error) {
		expense.ID = "new_expense_id"
		return expense, nil
	},
	FindExpenseFunc: func(id string, uid string) (model.Expense, error) {
		for _, ex := range expenseTestData {
			if id == ex.ID && uid == ex.UID {
				return ex, nil
			}
		}
		return model.Expense{}, gorm.ErrRecordNotFound
	},
	UpdateExpenseFunc: func(uid string, expense model.Expense) (model.Expense, error) {
		return expense, nil
	},
	DeleteExpenseFunc: func(id string, uid string) error {
		return nil
	},
	FindColumnChartExpenseDataFunc: func(uid string) ([]repositories.ColumnChartData, error) {
		return []repositories.ColumnChartData{
			{
				CategoryName: "Food",
				Month:        "2023-05",
				Amount:       1000,
			},
			{
				CategoryName: "Food",
				Month:        "2023-06",
				Amount:       2000,
			},
			{
				CategoryName: "Car",
				Month:        "2023-05",
				Amount:       3000,
			},
		}, nil
	},
	FindPieChartCategoryDataFunc: func(uid string, start *time.Time, end *time.Time) ([]repositories.PieChartData, error) {
		return []repositories.PieChartData{
			{
				Name:   "Food",
				Amount: 1000,
			},
			{
				Name:   "Car",
				Amount: 3000,
			},
		}, nil
	},
	FindPieChartLocationDataFunc: func(uid string, start *time.Time, end *time.Time) ([]repositories.PieChartData, error) {
		return []repositories.PieChartData{
			{
				Name:   "Amazon",
				Amount: 500,
			},
		}, nil
	},
}

var IncomeRepositoryMock = srepositories.IncomeRepositoryMock{
	FindIncomesFunc: func(uid string, start *time.Time, end *time.Time) ([]model.Income, error) {
		return incomeTestData, nil
	},
	FindColumnChartIncomeDataFunc: func(uid string) ([]repositories.ColumnChartData, error) {
		return []repositories.ColumnChartData{
			{
				CategoryName: "Salary",
				Month:        "2023-05",
				Amount:       3000,
			},
			{
				CategoryName: "Salary",
				Month:        "2023-07",
				Amount:       2000,
			},
		}, nil
	},
	FindIncomeFunc: func(id string, uid string) (model.Income, error) {
		for _, ex := range incomeTestData {
			if id == ex.ID && uid == ex.UID {
				return ex, nil
			}
		}
		return model.Income{}, gorm.ErrRecordNotFound
	},
	UpdateIncomeFunc: func(uid string, income model.Income) (model.Income, error) {
		return income, nil
	},
	CreateIncomeFunc: func(uid string, income model.Income) (model.Income, error) {
		income.ID = "new_income_id"
		return income, nil
	},
}

var IncomeTypeRepositoryMock = srepositories.IncomeTypeRepositoryMock{
	FindIncomeTypesFunc: func(uid string) ([]model.IncomeType, error) {
		return incomeTypeTestData, nil
	},

	FindOrCreateIncomeTypeFunc: func(uid string, name string) (model.IncomeType, error) {
		return model.IncomeType{ID: "NewIncomeTypeID", UID: uid, Name: name}, nil
	},
	CreateIncomeTypeFunc: func(uid string, incomeType model.IncomeType) (model.IncomeType, error) {
		incomeType.UID = uid
		incomeType.ID = "TEST_NEW_INCOME_TYPE_ID"
		return incomeType, nil
	},
	UpdateIncomeTypeFunc: func(uid string, incomeType model.IncomeType) (model.IncomeType, error) {
		return incomeType, nil
	},
	DeleteIncomeTypeFunc: func(id string, uid string) error {
		return nil
	},
}

var TransactionMonthsRepositoryMock = srepositories.TransactionMonthsRepositoryMock{
	FindTransactionMonthsFunc: func(uid string) ([]string, error) {
		return []string{"2023-06", "2023-05", "2023-02"}, nil
	},
}
