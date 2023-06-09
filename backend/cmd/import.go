package cmd

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"regexp"
	"strconv"
	"strings"
	"time"

	"gorm.io/gorm"

	"github.com/joho/godotenv"
	"github.com/rs/xid"
	"github.com/spf13/cobra"
	"github.com/wakamenod/suito/db"
	"github.com/wakamenod/suito/model"
)

const (
	dataDir      = "./cmd/suito_data"
	locationFile = "locations.tsv"
	dateLayout   = "2006-01-02"
)

var (
	regexMonthlyFile = regexp.MustCompile(`^\d{4}-\d{2}\.tsv$`)
	regexYearlyFile  = regexp.MustCompile(`^\d{4}\.tsv$`)
	jst              = time.FixedZone("Asia/Tokyo", 9*60*60)
)

var importCmd = &cobra.Command{
	Use:   "import",
	Short: "Import Test Data",
	Run: func(cmd *cobra.Command, args []string) {
		// load env file
		fatalIfErr(godotenv.Load("../.env.suito"))

		// open Database
		db := db.OpenDB()

		importLocations(db)

		// walk through test data directory
		entries, err := os.ReadDir(dataDir)
		fatalIfErr(err, "failed to read dir")
		for _, entry := range entries {
			if entry.IsDir() {
				continue
			}
			switch name := entry.Name(); {
			case regexMonthlyFile.MatchString(name):
				importMonthlyFile(db, entry)
			case regexYearlyFile.MatchString(name):
				importYearlyFile(db, entry)
			}
		}
	},
}

func importLocations(db *gorm.DB) {
	file, err := os.Open(dataDir + "/" + locationFile)
	fatalIfErr(err)
	defer file.Close()

	scanner := bufio.NewScanner(file)

	for scanner.Scan() {
		fatalIfErr(db.Create(&model.ExpenseLocation{
			ID:   xid.New().String(),
			UID:  os.Getenv("FIREBASE_UID"),
			Name: scanner.Text(),
		}).Error)
	}
	fatalIfErr(scanner.Err())
}

func importYearlyFile(db *gorm.DB, entry os.DirEntry) {
	file, err := os.Open(dataDir + "/" + entry.Name())
	fatalIfErr(err)
	defer file.Close()

	year, err := strconv.Atoi(entry.Name()[:4])
	fatalIfErr(err)

	scanner := bufio.NewScanner(file)

	row := 0
	for scanner.Scan() {
		row++
		title, income, category := func() (string, bool, string) {
			switch row {
			case 3, 4, 5:
				return os.Getenv(fmt.Sprintf("IMPORT_YEARLY_NAME_%d", row)), true, ""
			case 7, 8, 9, 10, 11, 12, 13, 14, 15, 17, 18:
				return os.Getenv(fmt.Sprintf("IMPORT_YEARLY_NAME_%d", row)), false, "日用品"
			case 16:
				return os.Getenv(fmt.Sprintf("IMPORT_YEARLY_NAME_%d", row)), false, "教育費"
			}
			return "", false, ""
		}()

		if title == "" {
			continue
		}

		fields := strings.Split(scanner.Text(), "\t")
		if income {
			createYearlyIncomes(db, fields, year, title)
		} else {
			createYearlyExpenses(db, fields, year, title, category)
		}
	}
	fatalIfErr(scanner.Err())
}

func importMonthlyFile(db *gorm.DB, entry os.DirEntry) {
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

func createYearlyExpenses(db *gorm.DB, fields []string, year int, title, category string) {
	categoryID := firstOrCreateCategory(db, category).ID
	currentMonth := time.Now().In(jst).Month()

	for i := 1; i <= 12; i++ {
		amount, err := strconv.Atoi(fields[i+1])
		if err != nil || amount == 0 {
			continue
		}
		if year == 2023 && i > int(currentMonth) {
			continue
		}

		expense := model.Expense{
			ID:                xid.New().String(),
			UID:               os.Getenv("FIREBASE_UID"),
			Title:             title,
			Amount:            amount,
			ExpenseCategoryID: categoryID,
			LocalDate:         time.Date(year, time.Month(i), 1, 0, 0, 0, 0, time.UTC),
		}
		fatalIfErr(db.Create(&expense).Error)
	}
}

func createYearlyIncomes(db *gorm.DB, fields []string, year int, name string) {
	incomeTypeID := firstOrCreateIncomeType(db, name).ID
	currentMonth := time.Now().In(jst).Month()
	for i := 1; i <= 12; i++ {
		amount, err := strconv.Atoi(fields[i+1])
		if err != nil || amount == 0 {
			continue
		}
		if year == 2023 && i > int(currentMonth) {
			continue
		}

		expense := model.Income{
			ID:           xid.New().String(),
			UID:          os.Getenv("FIREBASE_UID"),
			IncomeTypeID: incomeTypeID,
			Amount:       amount,
			LocalDate:    time.Date(year, time.Month(i), 1, 0, 0, 0, 0, time.UTC),
		}
		fatalIfErr(db.Create(&expense).Error)
	}
}

func createExpense(db *gorm.DB, date, title, categoryID string, amount int) {
	parsedDate, err := time.Parse(dateLayout, date)
	if err != nil {
		fatalIfErr(err, "failed to parse date")
	}

	var locationID string
	if location := findExpenseLocationByName(db, title); location != nil {
		locationID = location.ID
	}

	expense := model.Expense{
		ID:                xid.New().String(),
		UID:               os.Getenv("FIREBASE_UID"),
		Title:             title,
		Amount:            amount,
		ExpenseCategoryID: categoryID,
		ExpenseLocationID: locationID,
		LocalDate:         parsedDate,
	}
	fatalIfErr(db.Create(&expense).Error)
}

func findExpenseLocationByName(db *gorm.DB, name string) *model.ExpenseLocation {
	var location model.ExpenseLocation
	err := db.Where("name LIKE ? AND uid = ?", fmt.Sprintf("%%%s%%", name), os.Getenv("FIREBASE_UID")).
		First(&location).Error
	if err == gorm.ErrRecordNotFound {
		return nil
	}
	fatalIfErr(err, "failed to Find Expense Location by Name")
	return &location
}

func firstOrCreateCategory(db *gorm.DB, categoryName string) model.ExpenseCategory {
	var category model.ExpenseCategory
	err := db.Where(model.ExpenseCategory{Name: categoryName, UID: os.Getenv("FIREBASE_UID")}).
		Attrs(model.ExpenseCategory{ID: xid.New().String()}).
		FirstOrCreate(&category).Error
	fatalIfErr(err, "failed to firstOrCreate Category")
	return category
}

func firstOrCreateIncomeType(db *gorm.DB, typeName string) model.IncomeType {
	var incomeType model.IncomeType
	err := db.Where(model.IncomeType{Name: typeName, UID: os.Getenv("FIREBASE_UID")}).
		Attrs(model.IncomeType{ID: xid.New().String()}).
		FirstOrCreate(&incomeType).Error
	fatalIfErr(err, "failed to firstOrCreate Income Type")
	return incomeType
}

func init() {
	rootCmd.AddCommand(importCmd)
}

func fatalIfErr(err error, msg ...string) {
	if err != nil {
		log.Fatal(strings.Join(msg, " ") + ": " + err.Error())
	}
}
