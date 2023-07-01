package repositories

import (
	"gorm.io/gorm"
)

// Expense Category Repository
type SuitoExpenseCategoryRepository struct {
	db *gorm.DB
}

func NewSuitoExpenseCategoryRepository(db *gorm.DB) *SuitoExpenseCategoryRepository {
	return &SuitoExpenseCategoryRepository{db: db}
}

func (r *SuitoExpenseCategoryRepository) StartTx(tx *gorm.DB) {
	r.db = tx
}

func (r *SuitoExpenseCategoryRepository) EndTx(db *gorm.DB) {
	r.db = db
}

// Expense Category Repository
type SuitoExpenseLocationRepository struct {
	db *gorm.DB
}

func NewSuitoExpenseLocationRepository(db *gorm.DB) *SuitoExpenseLocationRepository {
	return &SuitoExpenseLocationRepository{db: db}
}

func (r *SuitoExpenseLocationRepository) StartTx(tx *gorm.DB) {
	r.db = tx
}

func (r *SuitoExpenseLocationRepository) EndTx(db *gorm.DB) {
	r.db = db
}

// Expense Schedule Repository
type SuitoExpenseScheduleRepository struct {
	db *gorm.DB
}

func NewSuitoExpenseScheduleRepository(db *gorm.DB) *SuitoExpenseScheduleRepository {
	return &SuitoExpenseScheduleRepository{db: db}
}

func (r *SuitoExpenseScheduleRepository) StartTx(tx *gorm.DB) {
	r.db = tx
}

func (r *SuitoExpenseScheduleRepository) EndTx(db *gorm.DB) {
	r.db = db
}

// Income Schedule Repository
type SuitoIncomeScheduleRepository struct {
	db *gorm.DB
}

func NewSuitoIncomeScheduleRepository(db *gorm.DB) *SuitoIncomeScheduleRepository {
	return &SuitoIncomeScheduleRepository{db: db}
}

func (r *SuitoIncomeScheduleRepository) StartTx(tx *gorm.DB) {
	r.db = tx
}

func (r *SuitoIncomeScheduleRepository) EndTx(db *gorm.DB) {
	r.db = db
}

// Expensee Repository
type SuitoExpenseRepository struct {
	db *gorm.DB
}

func NewSuitoExpenseRepository(db *gorm.DB) *SuitoExpenseRepository {
	return &SuitoExpenseRepository{db: db}
}

func (r *SuitoExpenseRepository) StartTx(tx *gorm.DB) {
	r.db = tx
}

func (r *SuitoExpenseRepository) EndTx(db *gorm.DB) {
	r.db = db
}

// Income Repository
type SuitoIncomeRepository struct {
	db *gorm.DB
}

func NewSuitoIncomeRepository(db *gorm.DB) *SuitoIncomeRepository {
	return &SuitoIncomeRepository{db: db}
}

func (r *SuitoIncomeRepository) StartTx(tx *gorm.DB) {
	r.db = tx
}

func (r *SuitoIncomeRepository) EndTx(db *gorm.DB) {
	r.db = db
}

// Income Type Repository
type SuitoIncomeTypeRepository struct {
	db *gorm.DB
}

func NewSuitoIncomeTypeRepository(db *gorm.DB) *SuitoIncomeTypeRepository {
	return &SuitoIncomeTypeRepository{db: db}
}

// Transaction Months TypeRepository
type SuitoTransactionMonthsRepository struct {
	db *gorm.DB
}

func NewSuitoTransactionMonthsRepository(db *gorm.DB) *SuitoTransactionMonthsRepository {
	return &SuitoTransactionMonthsRepository{db: db}
}

// User TypeRepository
type SuitoUserRepository struct {
	db *gorm.DB
}

func NewSuitoUserRepository(db *gorm.DB) *SuitoUserRepository {
	return &SuitoUserRepository{db: db}
}

func (r *SuitoUserRepository) StartTx(tx *gorm.DB) {
	r.db = tx
}

func (r *SuitoUserRepository) EndTx(db *gorm.DB) {
	r.db = db
}
