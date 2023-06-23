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

type IncomeScheduleController struct {
	service services.IncomeScheduleService
}

func NewIncomeScheduleController(s services.IncomeScheduleService) *IncomeScheduleController {
	return &IncomeScheduleController{service: s}
}

type (
	IncomeScheduleDetailReq struct {
		ID string `json:"id" validate:"required"`
	} // @Name IncomeScheduleDetailReq
	IncomeScheduleDetailRes struct {
		IncomeShcedule model.IncomeSchedule `json:"incomeShcedule"`
	} // @Name IncomeScheduleDetailRes
)

// @Summary     Get income schedule detail
// @Description 購入スケジュール詳細情報を取得します.
// @Tags        suito.incomeSchedule
// @ID          incomeScheduleDetail
// @Accept      json
// @Produce     json
// @Param       request body  IncomeScheduleDetailReq     true           "income detail req"
// @Success     200 {object}  IncomeScheduleDetailRes     "Success"
// @Failure     500 {object}  apperrors.SuitoError "Unknown Error"
// @Router      /income-schedule/detail [POST]
func (s *IncomeScheduleController) IncomeScheduleDetailHandler(c echo.Context) error {
	var req IncomeScheduleDetailReq

	if err := c.Bind(&req); err != nil {
		return errors.Wrap(err, "failed bind")
	}
	if err := c.Validate(req); err != nil {
		return err
	}

	uid := c.Get(middleware.UIDKey).(string)
	incomeSchedule, err := s.service.FindIncomeScheduleService(req.ID, uid)
	if err != nil {
		return err
	}

	var res IncomeScheduleDetailRes
	res.IncomeShcedule = incomeSchedule
	return webutils.Response(c, http.StatusOK, res)
}
