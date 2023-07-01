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

type ExpenseCategoryController struct {
	service services.ExpenseCategoryService
}

func NewExpenseCategoryController(s services.ExpenseCategoryService) *ExpenseCategoryController {
	return &ExpenseCategoryController{service: s}
}

type (
	ListExpenseCategoriesRes struct {
		ExpenseCategories []model.ExpenseCategory `json:"expenseCategories"`
	} // @Name ListExpenseCategoriesRes

	ListExpenseLocationsRes struct {
		ExpenseLocations []model.ExpenseLocation `json:"expenseLocations"`
	} // @Name ListExpenseLocationsRes

	RegisterExpenseCategoryReq struct {
		ExpenseCategory model.ExpenseCategory `json:"expenseCategory" validate:"required"`
	} // @Name RegisterExpenseCategoryReq
	RegisterExpenseCategoryRes struct {
		NewExpenseCategory model.ExpenseCategory `json:"newExpenseCategory"`
	} // @Name RegisterExpenseCategoryRes

	UpdateExpenseCategoryReq struct {
		ExpenseCategory model.ExpenseCategory `json:"expenseCategory" validate:"required"`
	} // @Name UpdateExpenseCategoryReq
	UpdateExpenseCategoryRes struct {
		UpdatedExpenseCategory model.ExpenseCategory `json:"updatedExpenseCategory"`
	} // @Name UpdateExpenseCategoryRes
)

// @Summary     List expense categories
// @Description 購入カテゴリー一覧を返却します.
// @Tags        suito.expenseCategory
// @ID          listExpenseCategories
// @Accept      json
// @Produce     json
// @Success     200 {object}  ListExpenseCategoriesRes "Success"
// @Failure     500 {object}  apperrors.SuitoError "Unknown Error"
// @Router      /expense/categories [GET]
func (s *ExpenseCategoryController) ExpenseCategoriesHandler(c echo.Context) error {
	var res ListExpenseCategoriesRes

	uid := c.Get(middleware.UIDKey).(string)

	categories, err := s.service.ListExpenseCategoryService(uid)
	if err != nil {
		return err
	}
	res.ExpenseCategories = categories

	return webutils.Response(c, http.StatusOK, res)
}

// @Summary     Register expense category
// @Description 支出カテゴリー情報を登録します
// @Tags        suito.expenseCategory
// @ID          registerExpenseCategory
// @Accept      json
// @Produce     json
// @Param       request body     RegisterExpenseCategoryReq   true           "register expenseCategory req"
// @Success     200     {object} RegisterExpenseCategoryRes   "Success"
// @Failure     500     {object} apperrors.SuitoError         "Unknown Error"
// @Router      /expense/categories [POST]
func (s *ExpenseCategoryController) RegisterExpenseCategoryHandler(c echo.Context) error {
	var req RegisterExpenseCategoryReq

	if err := c.Bind(&req); err != nil {
		return errors.Wrap(err, "failed bind")
	}
	if err := c.Validate(req); err != nil {
		return err
	}

	uid := c.Get(middleware.UIDKey).(string)
	newExpenseCategory, err := s.service.CreateExpenseCategoryService(uid, req.ExpenseCategory)
	if err != nil {
		return err
	}

	var res RegisterExpenseCategoryRes
	res.NewExpenseCategory = newExpenseCategory

	return webutils.Response(c, http.StatusOK, res)
}

// @Summary     Update expense category
// @Description 支出カテゴリー情報を更新します
// @Tags        suito.expenseCategory
// @ID          updateExpenseCategory
// @Accept      json
// @Produce     json
// @Param       request body     UpdateExpenseCategoryReq   true           "update expenseCategory req"
// @Success     200     {object} UpdateExpenseCategoryRes   "Success"
// @Failure     500     {object} apperrors.SuitoError       "Unknown Error"
// @Router      /expense/categories [PUT]
func (s *ExpenseCategoryController) UpdateExpenseCategoryHandler(c echo.Context) error {
	var req UpdateExpenseCategoryReq

	if err := c.Bind(&req); err != nil {
		return errors.Wrap(err, "failed bind")
	}
	if err := c.Validate(req); err != nil {
		return err
	}

	uid := c.Get(middleware.UIDKey).(string)
	expenseCategory, err := s.service.UpdateExpenseCategoryService(uid, req.ExpenseCategory)
	if err != nil {
		return err
	}

	var res UpdateExpenseCategoryRes
	res.UpdatedExpenseCategory = expenseCategory

	return webutils.Response(c, http.StatusOK, res)
}
