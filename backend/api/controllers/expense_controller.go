package controllers

import (
	"net/http"

	"github.com/labstack/echo/v4"
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

)

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

	categoreis, err := s.service.ListExpenseCategoryService(uid)
	if err != nil {
		return err
	}
	res.ExpenseCategories = categoreis

	return webutils.Response(c, http.StatusOK, res)
}
