package repositories

import (
	"fmt"
	"os"
	"testing"

	"github.com/joho/godotenv"
	"github.com/pkg/errors"
	"github.com/wakamenod/suito/db"
	"github.com/wakamenod/suito/log"
	"gorm.io/gorm"
)

var testDB *gorm.DB

func openDB() error {
	if err := godotenv.Load("../../../.env.suito"); err != nil {
		return errors.Wrap(err, "failed to load env file")
	}
	testDB = db.OpenTestDB()
	return nil
}

func setup() error {
	if err := log.InitWithConfigPath("../../config/config.test.toml"); err != nil {
		return err
	}
	err := openDB()
	if err != nil {
		return err
	}

	return nil
}

func teardown() {
	sqlDB, err := testDB.DB()
	if err != nil {
		log.Fatal(err, nil)
	}
	sqlDB.Close()
}

func TestMain(m *testing.M) {
	err := setup()
	if err != nil {
		// nolint
		fmt.Fprintf(os.Stderr, "err in repository TestMain %v\n", err)
		panic(err)
	}

	m.Run()

	teardown()
}
