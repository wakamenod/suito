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

type ExpenseScheduleController struct {
	service services.ExpenseScheduleService
}

func NewExpenseScheduleController(s services.ExpenseScheduleService) *ExpenseScheduleController {
	return &ExpenseScheduleController{service: s}
}

type (
	ExpenseScheduleDetailReq struct {
		ID string `json:"id" validate:"required"`
	} // @Name ExpenseScheduleDetailReq
	ExpenseScheduleDetailRes struct {
		ExpenseShcedule model.ExpenseSchedule `json:"expenseShcedule"`
	} // @Name ExpenseScheduleDetailRes
)

// @Summary     Get expense schedule detail
// @Description 購入スケジュール詳細情報を取得します.
// @Tags        suito.expenseSchedule
// @ID          expenseScheduleDetail
// @Accept      json
// @Produce     json
// @Param       request body  ExpenseScheduleDetailReq     true           "expense detail req"
// @Success     200 {object}  ExpenseScheduleDetailRes     "Success"
// @Failure     500 {object}  apperrors.SuitoError "Unknown Error"
// @Router      /expense-schedule/detail [POST]
func (s *ExpenseScheduleController) ExpenseScheduleDetailHandler(c echo.Context) error {
	var req ExpenseScheduleDetailReq

	if err := c.Bind(&req); err != nil {
		return errors.Wrap(err, "failed bind")
	}
	if err := c.Validate(req); err != nil {
		return err
	}

	uid := c.Get(middleware.UIDKey).(string)
	expenseSchedule, err := s.service.FindExpenseScheduleService(req.ID, uid)
	if err != nil {
		return err
	}

	var res ExpenseScheduleDetailRes
	res.ExpenseShcedule = expenseSchedule
	return webutils.Response(c, http.StatusOK, res)
}
