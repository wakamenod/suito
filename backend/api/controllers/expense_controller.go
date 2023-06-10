package controllers

import (
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/pkg/errors"
	"github.com/wakamenod/suito/api/controllers/services"
	"github.com/wakamenod/suito/middleware"
	"github.com/wakamenod/suito/model"
	"github.com/wakamenod/suito/utils/webutils"
)

type ExpenseController struct {
	service services.ExpenseService
}

func NewExpenseController(s services.ExpenseService) *ExpenseController {
	return &ExpenseController{service: s}
}

type (
	ListExpenseCategoriesRes struct {
		ExpenseCategories []model.ExpenseCategory `json:"expenseCategories"`
	} // @Name ListExpenseCategoriesRes

	ListExpenseLocationsRes struct {
		ExpenseLocations []model.ExpenseLocation `json:"expenseLocations"`
	} // @Name ListExpenseLocationsRes

	RegisterExpenseReq struct {
		Expense  model.Expense `json:"expense" validate:"required"`
		Category string        `json:"category"`
		Location string        `json:"location"`
	} // @Name RegisterExpenseReq
	RegisterExpenseRes struct {
		NewExpense model.Expense `json:"newExpense"`
	} // @Name RegisterExpenseRes

	ExpenseDetailReq struct {
		ID string `json:"id" validate:"required"`
	} // @Name ExpenseDetailReq
	ExpenseDetailRes struct {
		Expense model.Expense `json:"expense"`
	} // @Name ExpenseDetailRes
)

// @Summary     Get expense detail
// @Description 購入詳細情報を取得します.
// @Tags        suito.expense
// @ID          expenseDetail
// @Accept      json
// @Produce     json
// @Param       request body  ExpenseDetailReq     true           "expense detail req"
// @Success     200 {object}  ExpenseDetailRes     "Success"
// @Failure     500 {object}  apperrors.SuitoError "Unknown Error"
// @Router      /expense/detail [POST]
func (s *ExpenseController) ExpenseDetailHandler(c echo.Context) error {
	var req ExpenseDetailReq

	if err := c.Bind(&req); err != nil {
		return errors.Wrap(err, "failed bind")
	}
	if err := c.Validate(req); err != nil {
		return err
	}

	uid := c.Get(middleware.UIDKey).(string)
	expense, err := s.service.FindExpenseService(req.ID, uid)
	if err != nil {
		return err
	}

	var res ExpenseDetailRes
	res.Expense = expense
	return webutils.Response(c, http.StatusOK, res)
}

// @Summary     List expense categories
// @Description 購入カテゴリー一覧を返却します.
// @Tags        suito.expense
// @ID          listExpenseCategories
// @Accept      json
// @Produce     json
// @Success     200 {object}  ListExpenseCategoriesRes "Success"
// @Failure     500 {object}  apperrors.SuitoError "Unknown Error"
// @Router      /expense/categories [GET]
func (s *ExpenseController) ExpenseCategoriesHandler(c echo.Context) error {
	var res ListExpenseCategoriesRes

	uid := c.Get(middleware.UIDKey).(string)

	categories, err := s.service.ListExpenseCategoryService(uid)
	if err != nil {
		return err
	}
	res.ExpenseCategories = categories

	return webutils.Response(c, http.StatusOK, res)
}

// @Summary     List expense locations
// @Description 購入場所ー一覧を返却します.
// @Tags        suito.expense
// @ID          listExpenseLocations
// @Accept      json
// @Produce     json
// @Success     200 {object}  ListExpenseLocationsRes "Success"
// @Failure     500 {object}  apperrors.SuitoError "Unknown Error"
// @Router      /expense/locations [GET]
func (s *ExpenseController) ExpenseLocationsHandler(c echo.Context) error {
	var res ListExpenseLocationsRes

	uid := c.Get(middleware.UIDKey).(string)

	locations, err := s.service.ListExpenseLocationService(uid)
	if err != nil {
		return err
	}
	res.ExpenseLocations = locations

	return webutils.Response(c, http.StatusOK, res)
}

// @Summary     Register expense
// @Description 支出情報を登録します
// @Tags        suito.expense
// @ID          registerExpense
// @Accept      json
// @Produce     json
// @Param       request body     RegisterExpenseReq   true           "register expense req"
// @Success     200     {object} RegisterExpenseRes   "Success"
// @Failure     500     {object} apperrors.SuitoError "Unknown Error"
// @Router      /expense [POST]
func (s *ExpenseController) RegisterExpenseHandler(c echo.Context) error {
	var req RegisterExpenseReq

	if err := c.Bind(&req); err != nil {
		return errors.Wrap(err, "failed bind")
	}
	if err := c.Validate(req); err != nil {
		return err
	}

	uid := c.Get(middleware.UIDKey).(string)
	newExpense, err := s.service.CreateExpenseService(uid, req.Expense, req.Category, req.Location)
	if err != nil {
		return err
	}

	var res RegisterExpenseRes
	res.NewExpense = newExpense

	return webutils.Response(c, http.StatusOK, res)
}
