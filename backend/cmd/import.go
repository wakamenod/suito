package cmd

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"regexp"
	"strconv"
	"strings"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"

	"github.com/joho/godotenv"
	"github.com/rs/xid"
	"github.com/spf13/cobra"
	"github.com/wakamenod/suito/model"
)

const (
	dataDir    = "./cmd/suito_data"
	dateLayout = "2006-01-02"
)

var (
	regexMonthlyFile = regexp.MustCompile(`^\d{4}-\d{2}\.tsv$`)
	// jst              = time.FixedZone("Asia/Tokyo", 9*60*60)
)

var importCmd = &cobra.Command{
	Use:   "import",
	Short: "Import Test Data",
	Run: func(cmd *cobra.Command, args []string) {
		// load env file
		fatalIfErr(godotenv.Load("../.env.suito"))

		// open Database
		db := openDB()

		// walk through test data directory
		entries, err := os.ReadDir(dataDir)
		fatalIfErr(err, "failed to read dir")
		for _, entry := range entries {
			if !entry.IsDir() && regexMonthlyFile.MatchString(entry.Name()) {
				importMonthlyFile(db, entry)
			}
		}
	},
}

func importMonthlyFile(db *gorm.DB, entry os.DirEntry) {
	// fmt.Printf("File Name : %s\n", entry.Name())
	file, err := os.Open(dataDir + "/" + entry.Name())
	fatalIfErr(err)
	defer file.Close()

	scanner := bufio.NewScanner(file)

	baseColumn := 0
	for scanner.Scan() {
		text := scanner.Text()

		if baseColumn > 0 {
			fields := strings.Split(text, "\t")
			amount, err := strconv.Atoi(fields[baseColumn+3])
			if err != nil {
				continue
			}

			date := fields[baseColumn]
			title := fields[baseColumn+2]
			category := firstOrCreateCategory(db, fields[baseColumn+1])
			createExpense(db, date, title, category.ID, amount)
		} else {
			if strings.Contains(text, "RECEIPTS") {
				fields := strings.Split(text, "\t")
				for i, field := range fields {
					if field == "RECEIPTS" {
						baseColumn = i
						break
					}
				}
			}
		}
	}
	fatalIfErr(scanner.Err())
}

func createExpense(db *gorm.DB, date, title, categoryID string, amount int) {
	expense := model.Expense{
		ID:                xid.New().String(),
		UID:               os.Getenv("FIREBASE_UID"),
		Title:             title,
		Amount:            amount,
		ExpenseCategoryID: categoryID,
		LocalDate:         date[0:4] + date[5:7] + date[8:10],
	}
	fatalIfErr(db.Create(&expense).Error)
}

func firstOrCreateCategory(db *gorm.DB, categoryName string) model.ExpenseCategory {
	var category model.ExpenseCategory
	err := db.Where(model.ExpenseCategory{Name: categoryName}).
		Attrs(model.ExpenseCategory{ID: xid.New().String(), UID: os.Getenv("FIREBASE_UID")}).
		FirstOrCreate(&category).Error
	fatalIfErr(err, "failed to firstOrCreate Category")
	return category
}

func init() {
	rootCmd.AddCommand(importCmd)
}

func openDB() *gorm.DB {
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8mb4&parseTime=True&loc=Local",
		os.Getenv("DB_USER"),
		os.Getenv("DB_PASS"),
		os.Getenv("DB_HOST"),
		os.Getenv("DB_PORT"),
		os.Getenv("DB_NAME"),
	)
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	fatalIfErr(err, "failed to open database")
	return db
}

func fatalIfErr(err error, msg ...string) {
	if err != nil {
		log.Fatal(strings.Join(msg, " ") + ": " + err.Error())
	}
}
