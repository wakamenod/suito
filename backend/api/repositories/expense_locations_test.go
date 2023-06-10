package repositories

import (
	"testing"
	"time"

	"github.com/rs/xid"
	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
)

func TestFindExpenseLocations(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	uid := "user01"
	require.NoError(t, tx.Create(&model.ExpenseLocation{
		ID:        xid.New().String(),
		Name:      "Location_01",
		UID:       uid,
		CreatedAt: time.Date(2023, 1, 1, 0, 0, 0, 0, time.UTC),
		UpdatedAt: time.Date(2023, 1, 1, 0, 0, 0, 0, time.UTC),
	}).Error, "failed to insert expense location")
	require.NoError(t, tx.Create(&model.ExpenseLocation{
		ID:        xid.New().String(),
		Name:      "Location_01 Other User",
		UID:       "user02",
		CreatedAt: time.Date(2023, 1, 1, 0, 0, 0, 0, time.UTC),
		UpdatedAt: time.Date(2023, 1, 1, 0, 0, 0, 0, time.UTC),
	}).Error, "failed to insert expense location")
	require.NoError(t, tx.Create(&model.ExpenseLocation{
		ID:        xid.New().String(),
		Name:      "Location_02",
		UID:       uid,
		CreatedAt: time.Date(2023, 5, 1, 0, 0, 0, 0, time.UTC),
		UpdatedAt: time.Date(2023, 1, 1, 0, 0, 0, 0, time.UTC),
	}).Error, "failed to insert expense location")
	// run
	res, err := NewSuitoRepository(tx).FindExpenseLocations(uid)
	// check
	require.NoError(t, err)
	require.Equal(t, 2, len(res))
	require.Equal(t, "Location_02", res[0].Name)
	require.Equal(t, "Location_01", res[1].Name)
}

func TestFindOrCreateExpenseLocation_New(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	// other user's data
	location := model.ExpenseLocation{
		ID:        xid.New().String(),
		Name:      "NEW_LOCATION",
		UID:       "user99",
		CreatedAt: time.Date(2023, 5, 1, 0, 0, 0, 0, time.UTC),
		UpdatedAt: time.Date(2023, 1, 1, 0, 0, 0, 0, time.UTC),
	}
	require.NoError(t, tx.Create(&location).Error)

	uid := "user01"
	// run
	res, err := NewSuitoRepository(tx).FindOrCreateExpenseLocation(uid, "NEW_LOCATION")
	// check
	require.NoError(t, err)
	require.Equal(t, "NEW_LOCATION", res.Name)
	require.Equal(t, uid, res.UID)
	require.NotEmpty(t, res.ID)

	var cnt int64
	tx.Model(&model.ExpenseLocation{}).Count(&cnt)
	require.EqualValues(t, 2, cnt)
}

func TestFindOrCreateExpenseLocation_Created(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	// other user's data
	require.NoError(t, tx.Create(&model.ExpenseLocation{
		ID:        xid.New().String(),
		Name:      "Location_02",
		UID:       "user99",
		CreatedAt: time.Date(2023, 5, 1, 0, 0, 0, 0, time.UTC),
		UpdatedAt: time.Date(2023, 1, 1, 0, 0, 0, 0, time.UTC),
	}).Error)

	location := model.ExpenseLocation{
		ID:        xid.New().String(),
		Name:      "Location_02",
		UID:       "user01",
		CreatedAt: time.Date(2023, 5, 1, 0, 0, 0, 0, time.UTC),
		UpdatedAt: time.Date(2023, 1, 1, 0, 0, 0, 0, time.UTC),
	}
	require.NoError(t, tx.Create(&location).Error)
	// run
	res, err := NewSuitoRepository(tx).FindOrCreateExpenseLocation(location.UID, location.Name)
	// check
	require.NoError(t, err)
	require.Equal(t, location.Name, res.Name)
	require.Equal(t, location.UID, res.UID)
	require.Equal(t, location.ID, res.ID)

	var cnt int64
	tx.Model(&model.ExpenseLocation{}).Count(&cnt)
	require.EqualValues(t, 2, cnt)
}
