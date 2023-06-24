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

	UpdateExpenseScheduleReq struct {
		ExpenseSchedule model.ExpenseSchedule `json:"expenseSchedule" validate:"required"`
	} // @Name UpdateExpenseScheduleReq
	UpdateExpenseScheduleRes struct {
		UpdatedExpenseSchedule model.ExpenseSchedule `json:"updatedExpenseSchedule"`
	} // @Name UpdateExpenseScheduleRes

	DeleteExpenseScheduleReq struct {
		ExpenseScheduleID string `json:"expenseScheduleId" validate:"required"`
	} // @Name DeleteExpenseScheduleReq
	DeleteExpenseScheduleRes struct {
	} // @Name DeleteExpenseScheduleRes

	RegisterExpenseScheduleReq struct {
		ExpenseSchedule model.ExpenseSchedule `json:"expenseSchedule" validate:"required"`
	} // @Name RegisterExpenseScheduleReq
	RegisterExpenseScheduleRes struct {
		NewExpenseSchedule model.ExpenseSchedule `json:"newExpenseSchedule"`
	} // @Name RegisterExpenseScheduleRes
)

// @Summary     Get expense schedule detail
// @Description 支出スケジュール詳細情報を取得します.
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

// @Summary     Update expense shcedule
// @Description 支出スケジュール情報を更新します
// @Tags        suito.expenseSchedule
// @ID          updateExpenseSchedule
// @Accept      json
// @Produce     json
// @Param       request body     UpdateExpenseScheduleReq     true           "update expenseSchedule req"
// @Success     200     {object} UpdateExpenseScheduleRes     "Success"
// @Failure     500     {object} apperrors.SuitoError "Unknown Error"
// @Router      /expense-schedule [PUT]
func (s *ExpenseScheduleController) UpdateExpenseScheduleHandler(c echo.Context) error {
	var req UpdateExpenseScheduleReq

	if err := c.Bind(&req); err != nil {
		return errors.Wrap(err, "failed bind")
	}
	if err := c.Validate(req); err != nil {
		return err
	}

	uid := c.Get(middleware.UIDKey).(string)
	updatedExpenseSchedule, err := s.service.UpdateExpenseScheduleService(uid, req.ExpenseSchedule)
	if err != nil {
		return err
	}

	var res UpdateExpenseScheduleRes
	res.UpdatedExpenseSchedule = updatedExpenseSchedule

	return webutils.Response(c, http.StatusOK, res)
}

// @Summary     Delete expense schedule
// @Description 支出スケジュール情報を削除します
// @Tags        suito.expenseSchedule
// @ID          deleteExpenseSchedule
// @Accept      json
// @Produce     json
// @Param       request body     DeleteExpenseScheduleReq     true           "delete expenseSchedule req"
// @Success     200     {object} DeleteExpenseScheduleRes     "Success"
// @Failure     500     {object} apperrors.SuitoError "Unknown Error"
// @Router      /expense-schedule [DELETE]
func (s *ExpenseScheduleController) DeleteExpenseScheduleHandler(c echo.Context) error {
	var req DeleteExpenseScheduleReq

	if err := c.Bind(&req); err != nil {
		return errors.Wrap(err, "failed bind")
	}
	if err := c.Validate(req); err != nil {
		return err
	}

	uid := c.Get(middleware.UIDKey).(string)
	err := s.service.DeleteExpenseScheduleService(req.ExpenseScheduleID, uid)
	if err != nil {
		return err
	}

	var res DeleteExpenseScheduleRes
	return webutils.Response(c, http.StatusOK, res)
}

// @Summary     Register expense schedule
// @Description 支出スケジュール情報を登録します
// @Tags        suito.expenseSchedule
// @ID          registerExpenseSchedule
// @Accept      json
// @Produce     json
// @Param       request body     RegisterExpenseScheduleReq   true           "register expenseSchedule req"
// @Success     200     {object} RegisterExpenseScheduleRes   "Success"
// @Failure     500     {object} apperrors.SuitoError "Unknown Error"
// @Router      /expense-schedule [POST]
func (s *ExpenseScheduleController) RegisterExpenseScheduleHandler(c echo.Context) error {
	var req RegisterExpenseScheduleReq

	if err := c.Bind(&req); err != nil {
		return errors.Wrap(err, "failed bind")
	}
	if err := c.Validate(req); err != nil {
		return err
	}

	uid := c.Get(middleware.UIDKey).(string)
	newExpenseSchedule, err := s.service.CreateExpenseScheduleService(uid, req.ExpenseSchedule)
	if err != nil {
		return err
	}

	var res RegisterExpenseScheduleRes
	res.NewExpenseSchedule = newExpenseSchedule

	return webutils.Response(c, http.StatusOK, res)
}
