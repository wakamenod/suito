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
		IncomeSchedule model.IncomeSchedule `json:"incomeSchedule"`
	} // @Name IncomeScheduleDetailRes

	UpdateIncomeScheduleReq struct {
		IncomeSchedule model.IncomeSchedule `json:"incomeSchedule" validate:"required"`
	} // @Name UpdateIncomeScheduleReq
	UpdateIncomeScheduleRes struct {
		UpdatedIncomeSchedule model.IncomeSchedule `json:"updatedIncomeSchedule"`
	} // @Name UpdateIncomeScheduleRes

	DeleteIncomeScheduleReq struct {
		IncomeScheduleID string `json:"incomeScheduleId" validate:"required"`
	} // @Name DeleteIncomeScheduleReq
	DeleteIncomeScheduleRes struct {
	} // @Name DeleteIncomeScheduleRes

)

// @Summary     Get income schedule detail
// @Description 収入スケジュール詳細情報を取得します.
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
	res.IncomeSchedule = incomeSchedule
	return webutils.Response(c, http.StatusOK, res)
}

// @Summary     Update income schedule
// @Description 収入スケジュール情報を更新します
// @Tags        suito.incomeSchedule
// @ID          updateIncomeSchedule
// @Accept      json
// @Produce     json
// @Param       request body     UpdateIncomeScheduleReq     true           "update incomeSchedule req"
// @Success     200     {object} UpdateIncomeScheduleRes     "Success"
// @Failure     500     {object} apperrors.SuitoError "Unknown Error"
// @Router      /income-schedule [PUT]
func (s *IncomeScheduleController) UpdateIncomeScheduleHandler(c echo.Context) error {
	var req UpdateIncomeScheduleReq

	if err := c.Bind(&req); err != nil {
		return errors.Wrap(err, "failed bind")
	}
	if err := c.Validate(req); err != nil {
		return err
	}

	uid := c.Get(middleware.UIDKey).(string)
	updatedIncomeSchedule, err := s.service.UpdateIncomeScheduleService(uid, req.IncomeSchedule)
	if err != nil {
		return err
	}

	var res UpdateIncomeScheduleRes
	res.UpdatedIncomeSchedule = updatedIncomeSchedule

	return webutils.Response(c, http.StatusOK, res)
}

// @Summary     Delete income schedule
// @Description 収入スケジュール情報を削除します
// @Tags        suito.incomeSchedule
// @ID          deleteIncomeSchedule
// @Accept      json
// @Produce     json
// @Param       request body     DeleteIncomeScheduleReq     true           "delete incomeSchedule req"
// @Success     200     {object} DeleteIncomeScheduleRes     "Success"
// @Failure     500     {object} apperrors.SuitoError "Unknown Error"
// @Router      /income-schedule [DELETE]
func (s *IncomeScheduleController) DeleteIncomeScheduleHandler(c echo.Context) error {
	var req DeleteIncomeScheduleReq

	if err := c.Bind(&req); err != nil {
		return errors.Wrap(err, "failed bind")
	}
	if err := c.Validate(req); err != nil {
		return err
	}

	uid := c.Get(middleware.UIDKey).(string)
	err := s.service.DeleteIncomeScheduleService(req.IncomeScheduleID, uid)
	if err != nil {
		return err
	}

	var res DeleteIncomeScheduleRes
	return webutils.Response(c, http.StatusOK, res)
}
