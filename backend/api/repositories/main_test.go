package repositories

import (
	"fmt"
	"os"
	"testing"

	"github.com/joho/godotenv"
	"github.com/pkg/errors"
	"github.com/spf13/viper"
	"github.com/wakamenod/suito/log"
	"go.uber.org/zap"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	gormlogger "gorm.io/gorm/logger"
	"moul.io/zapgorm2"
)

var testDB *gorm.DB

func openDB() error {
	if err := godotenv.Load("../../../.env.suito"); err != nil {
		return errors.Wrap(err, "failed to load env file")
	}
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8mb4&parseTime=True",
		os.Getenv("DB_USER"),
		os.Getenv("DB_PASS"),
		os.Getenv("DB_HOST"),
		os.Getenv("DB_PORT"),
		os.Getenv("DB_NAME_TEST"),
	)
	logger := zapgorm2.New(zap.L())
	logger.SetAsDefault()
	logger.LogLevel = gormlogger.Info
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{
		Logger: logger,
	})
	if err != nil {
		return errors.Wrap(err, "failed to open test DB")
	}
	testDB = db
	return nil
}

func initLogger() error {
	viper.SetConfigFile("../../config/config.test.toml")
	if err := viper.ReadInConfig(); err != nil {
		return errors.Wrap(err, "config read error")
	}

	outPath := viper.GetString("log.log")
	errPath := viper.GetString("log.err_log")
	level := viper.GetString("log.level")
	c := log.LogConfig{
		OutPath: outPath,
		ErrPath: errPath,
		Level:   level,
	}
	if err := log.Init(c); err != nil {
		return errors.Wrap(err, "failed to init logger")
	}

	return nil
}

func setup() error {
	if err := initLogger(); err != nil {
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
