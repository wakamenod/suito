package repositories

import (
	"testing"
	"time"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
	"github.com/wakamenod/suito/utils/testutils"
	"gorm.io/gorm"
)

// An empty result set should not cause an error
func TestFindExpenseSchedules(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	// run
	res, err := NewSuitoRepository(tx).FindExpenseSchedules("")
	// check
	require.NoError(t, err)
	require.Empty(t, res)
}

// Other user's date should never be retrieved
func TestFindExpenseSchedules2(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := testutils.NewTestDataInserter(t, tx)
	userID := "user1"
	i.InsertExpenseSchedule(userID, "title1", "America/New_York")
	i.InsertExpenseSchedule("user99", "title_other_user", "Asia/Tokyo")
	i.InsertExpenseSchedule(userID, "title2", "Asia/Tokyo",
		i.WithExpenseAmount(100),
		i.WithExpenseMemo("memo"),
		i.WithExpenseCategoryID("categoryID"),
		i.WithExpenseLocationID("locationID"),
	)
	i.InsertExpenseSchedule(userID, "", "",
		i.WithExpenseScheduleDeletedAt(gorm.DeletedAt{Valid: true, Time: time.Now()}),
	)
	// run
	res, err := NewSuitoRepository(tx).FindExpenseSchedules(userID)
	// check
	require.NoError(t, err)
	require.Equal(t, 2, len(res))
	{
		schedule := res[0]
		require.Equal(t, "title1", schedule.Title)
		require.Equal(t, "America/New_York", schedule.Timezone)
		require.Equal(t, 200, schedule.Amount)
		require.Equal(t, "", schedule.Memo)
		require.Equal(t, "", schedule.ExpenseCategoryID)
		require.Equal(t, "", schedule.ExpenseLocationID)
	}
	{
		schedule := res[1]
		require.Equal(t, "title2", schedule.Title)
		require.Equal(t, "Asia/Tokyo", schedule.Timezone)
		require.Equal(t, 100, schedule.Amount)
		require.Equal(t, "memo", schedule.Memo)
		require.Equal(t, "categoryID", schedule.ExpenseCategoryID)
		require.Equal(t, "locationID", schedule.ExpenseLocationID)
	}
}

func TestFindExpenseSchedule(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data

	userID := "user1"
	i := testutils.NewTestDataInserter(t, tx)
	categoryID := i.InsertExpenseCategory(userID, "CategoryName").ID
	locationID := i.InsertExpenseLocation(userID, "LocationName").ID
	id := i.InsertExpenseSchedule(userID, "title01", "Asia/Tokyo",
		i.WithExpenseCategoryID(categoryID),
		i.WithExpenseLocationID(locationID),
	).ID
	// run
	res, err := NewSuitoRepository(tx).FindExpenseSchedule(id, userID)
	// check
	require.NoError(t, err)
	require.Equal(t, id, res.ID)
	require.Equal(t, "title01", res.Title)
	require.Equal(t, 200, res.Amount)
	require.Equal(t, "CategoryName", res.ExpenseCategory.Name)
	require.Equal(t, "LocationName", res.ExpenseLocation.Name)
}

func TestFindExpenseSchedule_ErrorNotFound(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	// i := testutils.NewTestDataInserter(t, tx)
	// run
	_, err := NewSuitoRepository(tx).FindExpenseSchedule("scheduleID", "user1")
	// check
	require.Error(t, err)
	require.ErrorIs(t, err, gorm.ErrRecordNotFound)
}

func TestUpdateExpenseSchedule(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	userID := "user1"
	i := testutils.NewTestDataInserter(t, tx)
	id := i.InsertExpenseSchedule(userID, "title01", "Asia/Tokyo").ID
	i.InsertExpenseSchedule("user99", "title99", "Asia/Tokyo")
	i.InsertExpenseSchedule(userID, "title01_2", "Asia/Tokyo")
	categoryID := i.InsertExpenseCategory(userID, "Test Category").ID
	locationID := i.InsertExpenseLocation(userID, "Test Location").ID
	targetExpenseSchedule := model.ExpenseSchedule{
		ID:                id,
		Title:             "update title",
		Amount:            2000,
		ExpenseCategoryID: categoryID,
		ExpenseLocationID: locationID,
	}
	// run
	_, err := NewSuitoRepository(tx).UpdateExpenseSchedule(userID, targetExpenseSchedule)
	// check
	require.NoError(t, err)

	found, err := NewSuitoRepository(tx).FindExpenseSchedule(id, userID)
	require.NoError(t, err)
	require.Equal(t, targetExpenseSchedule.Title, found.Title)
	require.Equal(t, targetExpenseSchedule.Amount, found.Amount)
	require.Equal(t, targetExpenseSchedule.ExpenseCategoryID, found.ExpenseCategoryID)
	require.Equal(t, targetExpenseSchedule.ExpenseLocationID, found.ExpenseLocationID)
	require.Equal(t, "Test Category", found.ExpenseCategory.Name)
	require.Equal(t, "Test Location", found.ExpenseLocation.Name)
}

func TestDeleteExpenseSchedule(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	userID := "user1"
	i := testutils.NewTestDataInserter(t, tx)
	id := i.InsertExpenseSchedule(userID, "title01", "Asia/Tokyo").ID
	i.InsertExpenseSchedule("user99", "title99", "Asia/Tokyo")
	i.InsertExpenseSchedule(userID, "title01_2", "Asia/Tokyo")
	// run
	err := NewSuitoRepository(tx).DeleteExpenseSchedule(id, userID)
	// check
	require.NoError(t, err)

	var found model.ExpenseSchedule
	require.NoError(t, tx.Where("id = ? AND uid = ?", id, userID).Unscoped().First(&found).Error)
	require.NotNil(t, found.DeletedAt)
}

func TestCreateScheduleExpense(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	userID := "user1"
	expenseSchedule := model.ExpenseSchedule{
		Title:             "title",
		Amount:            2000,
		ExpenseCategoryID: "category_id",
		ExpenseLocationID: "location_id",
		Timezone:          "Asia/Tokyo",
		Memo:              "test memo",
	}
	// run
	res, err := NewSuitoRepository(tx).CreateExpenseSchedule(userID, expenseSchedule)
	// check
	require.NoError(t, err)
	require.NotEmpty(t, res.ID)
	require.Equal(t, userID, res.UID)
	require.Equal(t, expenseSchedule.Title, res.Title)
	require.Equal(t, expenseSchedule.Amount, res.Amount)
	require.Equal(t, expenseSchedule.ExpenseCategoryID, res.ExpenseCategoryID)
	require.Equal(t, expenseSchedule.ExpenseLocationID, res.ExpenseLocationID)
	require.Equal(t, expenseSchedule.Timezone, res.Timezone)
	require.Equal(t, expenseSchedule.Memo, res.Memo)
}
