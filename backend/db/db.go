package db

import (
	"fmt"
	"log"
	"os"

	"go.uber.org/zap"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	gormlogger "gorm.io/gorm/logger"
	"moul.io/zapgorm2"
)

func OpenDB() *gorm.DB {
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8mb4&parseTime=True",
		os.Getenv("DB_USER"),
		os.Getenv("DB_PASS"),
		os.Getenv("DB_HOST"),
		os.Getenv("DB_PORT"),
		os.Getenv("DB_NAME"),
	)
	logger := zapgorm2.New(zap.L())
	logger.SetAsDefault()
	logger.LogLevel = gormlogger.Info
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{
		TranslateError: true,
		Logger:         logger,
	})
	if err != nil {
		log.Fatal("failed to open database")
	}

	return db
}

func OpenTestDB() *gorm.DB {
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
		TranslateError: true,
		Logger:         logger,
	})
	if err != nil {
		log.Fatal("failed to open database")
	}

	return db
}
