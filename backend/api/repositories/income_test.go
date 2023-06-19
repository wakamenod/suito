package repositories

import (
	"fmt"
	"testing"
	"time"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
	"github.com/wakamenod/suito/utils/dateutils"
	"github.com/wakamenod/suito/utils/testutils"
	"gorm.io/gorm"
)

// An empty result set should not cause an error
func TestFindIncomes(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	// run
	start, end, err := dateutils.YearMonthDateRange("2023-05")
	require.NoError(t, err)
	res, err := NewSuitoRepository(tx).FindIncomes("", start, end)
	// check
	require.NoError(t, err)
	require.Empty(t, res)
}

// Other user's date should never be retrieved
func TestFindIncomes2(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)

	{
		incomeType := i.InsertIncomeType("user2", "title01")
		i.InsertIncome("user1", "2023-05-01", incomeType.ID)
	}
	{
		incomeType := i.InsertIncomeType("user2", "title02")
		i.InsertIncome("user2", "2023-05-02", incomeType.ID)
	}
	{
		incomeType := i.InsertIncomeType("user2", "title03")
		i.InsertIncome("user1", "2023-05-03", incomeType.ID)
	}
	{
		incomeType := i.InsertIncomeType("user2", "title06")
		i.InsertIncome("user1", "2023-06-01", incomeType.ID)
	}

	// run
	start, end, err := dateutils.YearMonthDateRange("2023-05")
	require.NoError(t, err)
	res, err := NewSuitoRepository(tx).FindIncomes("user1", start, end)
	// check
	require.NoError(t, err)
	require.Equal(t, 2, len(res))
	require.Equal(t, "title03", res[0].IncomeType.Name)
	require.Equal(t, "title01", res[1].IncomeType.Name)
}

// Check date range
func TestFindIncomes3(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	{
		incomeType := i.InsertIncomeType("user2", "title01")
		i.InsertIncome("user1", "2023-05-01", incomeType.ID)
	}
	{
		incomeType := i.InsertIncomeType("user2", "title02")
		i.InsertIncome("user1", "2023-05-02", incomeType.ID)
	}
	{
		incomeType := i.InsertIncomeType("user2", "title03")
		i.InsertIncome("user1", "2023-06-03", incomeType.ID)
	}
	// run
	start, end, err := dateutils.YearMonthDateRange("2023-05")
	require.NoError(t, err)
	res, err := NewSuitoRepository(tx).FindIncomes("user1", start, end)
	// check
	require.NoError(t, err)
	require.Equal(t, 2, len(res))
	require.Equal(t, "title02", res[0].IncomeType.Name)
	require.Equal(t, "title01", res[1].IncomeType.Name)
}

func TestFindIncome(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	incomeType := i.InsertIncomeType("user2", "title02")
	id := i.InsertIncome("user2", "2023-05-02", incomeType.ID)
	// run
	res, err := NewSuitoRepository(tx).FindIncome(id, "user2")
	// check
	require.NoError(t, err)
	require.Equal(t, id, res.ID)
	require.Equal(t, "title02", res.IncomeType.Name)
}

func TestFindIncome_ErrorNotFound(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	id := i.InsertIncome("user2", "2023-05-02", "title02")
	// run
	_, err := NewSuitoRepository(tx).FindIncome(id, "user1")
	// check
	require.Error(t, err)
	require.ErrorIs(t, err, gorm.ErrRecordNotFound)
}

func TestCreateIncome(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	income := model.Income{IncomeType: model.IncomeType{Name: "title"}, Amount: 2000, LocalDate: time.Date(2023, 5, 1, 0, 0, 0, 0, time.UTC)}
	// run
	res, err := NewSuitoRepository(tx).CreateIncome("user1", income)
	// check
	require.NoError(t, err)
	require.NotEmpty(t, res.ID)
	require.Equal(t, "user1", res.UID)
	require.Equal(t, income.IncomeType.Name, res.IncomeType.Name)
	require.Equal(t, income.Amount, res.Amount)
}

func TestHardDeleteAllUserIncomes(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertExpense("user1", "2023-05-01", "title01")
	i.InsertExpense("user99", "2023-05-01", "title99")
	i.InsertExpense("user1", "2023-05-01", "title01_2")
	// run
	err := NewSuitoRepository(tx).HardDeleteAllUserExpenses("user1")
	// check
	require.NoError(t, err)

	var found model.Expense
	err = tx.Where("uid = ?", "user1").Unscoped().First(&found).Error
	require.Error(t, err)
	require.ErrorIs(t, err, gorm.ErrRecordNotFound)

	var cnt int64
	tx.Model(&model.Expense{}).Count(&cnt)
	require.EqualValues(t, 1, cnt)
}

func TestFindColumnChartIncomeData(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	i := testutils.NewTestDataInserter(t, tx)
	userID := "user1"
	i.InsertIncome(userID, "2023-05-01")
	i.InsertIncome("user99", "2023-05-01")
	i.InsertIncome(userID, "2023-05-01")
	salary := i.InsertIncomeType(userID, "Salary")
	i.InsertIncome(userID, "2023-06-01", salary.ID)
	i.InsertIncome("user99", "2023-05-01", salary.ID)
	i.InsertIncome(userID, "2023-05-01", salary.ID)
	// run
	res, err := NewSuitoRepository(tx).FindColumnChartIncomeData(userID)
	// check
	require.NoError(t, err)

	expects := []ColumnChartData{
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
	}
	require.Equal(t, len(expects), len(res))
	for i, e := range expects {
		require.Equal(t, e.CategoryName, res[i].CategoryName, fmt.Sprintf("Category name mismatch (row:%d)\n", i+1))
		require.Equal(t, e.Amount, res[i].Amount, fmt.Sprintf("Amount mismatch (row:%d)\n", i+1))
		require.Equal(t, e.Month, res[i].Month, fmt.Sprintf("Month mismatch (row:%d)\n", i+1))
	}
}
