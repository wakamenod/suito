package repositories

import (
	"testing"
	"time"

	"github.com/rs/xid"
	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
	"github.com/wakamenod/suito/utils/dateutils"
	"gorm.io/gorm"
)

type (
	incomeInserter struct {
		t  *testing.T
		db *gorm.DB
	}
)

func newIncomeInserter(t *testing.T, db *gorm.DB) *incomeInserter {
	return &incomeInserter{
		t:  t,
		db: db,
	}
}

func (e *incomeInserter) mustInsert(uid, date, title string) {
	parsedDate, err := time.Parse(dateLayout, date)
	require.NoError(e.t, err, "failed to parse date")

	require.NoError(e.t, e.db.Create(&model.Income{
		ID:        xid.New().String(),
		UID:       uid,
		Title:     title,
		Amount:    200,
		Memo:      "test memo",
		LocalDate: parsedDate,
	}).Error, "failed to insert income")
}

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
	i := newIncomeInserter(t, tx)
	i.mustInsert("user1", "2023-05-01", "title01")
	i.mustInsert("user2", "2023-05-02", "title02")
	i.mustInsert("user1", "2023-05-03", "title03")
	// run
	start, end, err := dateutils.YearMonthDateRange("2023-05")
	require.NoError(t, err)
	res, err := NewSuitoRepository(tx).FindIncomes("user1", start, end)
	// check
	require.NoError(t, err)
	require.Equal(t, 2, len(res))
	require.Equal(t, "title03", res[0].Title)
	require.Equal(t, "title01", res[1].Title)
}

// Check date range
func TestFindIncomes3(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup test data
	i := newIncomeInserter(t, tx)
	i.mustInsert("user1", "2023-05-01", "title01")
	i.mustInsert("user1", "2023-05-02", "title02")
	i.mustInsert("user1", "2023-06-03", "title03")
	// run
	start, end, err := dateutils.YearMonthDateRange("2023-05")
	require.NoError(t, err)
	res, err := NewSuitoRepository(tx).FindIncomes("user1", start, end)
	// check
	require.NoError(t, err)
	require.Equal(t, 2, len(res))
	require.Equal(t, "title02", res[0].Title)
	require.Equal(t, "title01", res[1].Title)
}

func TestCreateIncome(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	income := model.Income{Title: "title", Amount: 2000, LocalDate: time.Date(2023, 5, 1, 0, 0, 0, 0, time.UTC)}
	// run
	res, err := NewSuitoRepository(tx).CreateIncome("user1", income)
	// check
	require.NoError(t, err)
	require.NotEmpty(t, res.ID)
	require.Equal(t, "user1", res.UID)
	require.Equal(t, income.Title, res.Title)
	require.Equal(t, income.Amount, res.Amount)
}
