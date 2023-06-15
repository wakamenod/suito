package repositories

import (
	"testing"
	"time"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/model"
	"github.com/wakamenod/suito/utils/testutils"
	"gorm.io/gorm"
)

func TestFindAllUIDs(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertUser("user1", gorm.DeletedAt{})
	i.InsertUser("user2", gorm.DeletedAt{})
	i.InsertUser("deleted_user", gorm.DeletedAt{Valid: true, Time: time.Date(2023, 5, 1, 0, 0, 0, 0, time.UTC)})
	// run
	res, err := NewSuitoRepository(tx).FindAllUIDs()
	// check
	require.NoError(t, err)
	require.Equal(t, 2, len(res))
	require.Contains(t, res, "user1")
	require.Contains(t, res, "user2")
}

func TestDeleteUsers(t *testing.T) {
	tx := begin()
	defer rollback(tx)
	// setup
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertUser("user1", gorm.DeletedAt{})
	i.InsertUser("user2", gorm.DeletedAt{})
	// run
	err := NewSuitoRepository(tx).DeleteUsers([]string{"user1", "user2"})
	// check
	require.NoError(t, err)

	var founds []model.User
	require.NoError(t, tx.Unscoped().Find(&founds).Order("uid").Error)
	require.Equal(t, "user1", founds[0].UID)
	require.NotNil(t, founds[0].DeletedAt)
	require.Equal(t, "user2", founds[1].UID)
	require.NotNil(t, founds[1].DeletedAt)
}

func TestFindOrCreateUser_New(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	// other user's data
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertUser("user99", gorm.DeletedAt{})

	uid := "user01"
	// run
	res, err := NewSuitoRepository(tx).FindOrCreateUser(uid)
	// check
	require.NoError(t, err)
	require.Equal(t, uid, res.UID)
	require.NotEmpty(t, res.ID)

	var cnt int64
	tx.Model(&model.User{}).Count(&cnt)
	require.EqualValues(t, 2, cnt)
}

func TestFindOrCreateUser_Created(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	// other user's data
	i := testutils.NewTestDataInserter(t, tx)
	i.InsertUser("user99", gorm.DeletedAt{})

	user := i.InsertUser("user01", gorm.DeletedAt{})
	// run
	res, err := NewSuitoRepository(tx).FindOrCreateUser(user.UID)
	// check
	require.NoError(t, err)
	require.Equal(t, user.UID, res.UID)
	require.Equal(t, user.ID, res.ID)

	var cnt int64
	tx.Model(&model.User{}).Count(&cnt)
	require.EqualValues(t, 2, cnt)
}

func TestFindOrCreateUser_Deleted(t *testing.T) {
	tx := begin()
	defer rollback(tx)

	i := testutils.NewTestDataInserter(t, tx)
	user := i.InsertUser("user01", gorm.DeletedAt{Valid: true, Time: time.Date(2023, 5, 1, 0, 0, 0, 0, time.UTC)})
	// run
	res, err := NewSuitoRepository(tx).FindOrCreateUser(user.UID)
	// check
	require.NoError(t, err)
	require.Equal(t, user.UID, res.UID)
	require.NotEqual(t, user.ID, res.ID)

	var cnt int64
	tx.Model(&model.User{}).Count(&cnt)
	require.EqualValues(t, 1, cnt)
}
