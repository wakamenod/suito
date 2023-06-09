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

type IncomeController struct {
	service services.IncomeService
}

func NewIncomeController(s services.IncomeService) *IncomeController {
	return &IncomeController{service: s}
}

type (
	RegisterIncomeReq struct {
		Income model.Income `json:"income"`
	} // @Name RegisterIncomeReq
	RegisterIncomeRes struct {
		NewIncome model.Income `json:"newIncome"`
	} // @Name RegisterIncomeRes

	IncomeDetailReq struct {
		ID string `json:"id" validate:"required"`
	} // @Name IncomeDetailReq
	IncomeDetailRes struct {
		Income model.Income `json:"income"`
	} // @Name IncomeDetailRes

	UpdateIncomeReq struct {
		Income model.Income `json:"income" validate:"required"`
	} // @Name UpdateIncomeReq
	UpdateIncomeRes struct {
		UpdatedIncome model.Income `json:"updatedIncome"`
	} // @Name UpdateIncomeRes

)

// @Summary     Get income detail
// @Description 収入詳細情報を取得します.
// @Tags        suito.income
// @ID          incomeDetail
// @Accept      json
// @Produce     json
// @Param       request body  IncomeDetailReq      true           "income detail req"
// @Success     200 {object}  IncomeDetailRes      "Success"
// @Failure     500 {object}  apperrors.SuitoError "Unknown Error"
// @Router      /income/detail [POST]
func (s *IncomeController) IncomeDetailHandler(c echo.Context) error {
	var req IncomeDetailReq

	if err := c.Bind(&req); err != nil {
		return errors.Wrap(err, "failed bind")
	}
	if err := c.Validate(req); err != nil {
		return err
	}

	uid := c.Get(middleware.UIDKey).(string)
	income, err := s.service.FindIncomeService(req.ID, uid)
	if err != nil {
		return err
	}

	var res IncomeDetailRes
	res.Income = income
	return webutils.Response(c, http.StatusOK, res)
}

// @Summary     Register income
// @Description 収入情報を登録します
// @Tags        suito.income
// @ID          registerIncome
// @Accept      json
// @Produce     json
// @Param       request body     RegisterIncomeReq    true           "register income req"
// @Success     200     {object} RegisterIncomeRes    "Success"
// @Failure     500     {object} apperrors.SuitoError "Unknown Error"
// @Router      /income [POST]
func (s *IncomeController) RegisterIncomeHandler(c echo.Context) error {
	var req RegisterIncomeReq

	if err := c.Bind(&req); err != nil {
		return errors.Wrap(err, "failed bind")
	}
	if err := c.Validate(req); err != nil {
		return err
	}

	uid := c.Get(middleware.UIDKey).(string)
	newIncome, err := s.service.CreateIncomeService(uid, req.Income)
	if err != nil {
		return err
	}

	var res RegisterIncomeRes
	res.NewIncome = newIncome

	return webutils.Response(c, http.StatusOK, res)
}

// @Summary     Update income
// @Description 収入情報を更新します
// @Tags        suito.income
// @ID          updateIncome
// @Accept      json
// @Produce     json
// @Param       request body     UpdateIncomeReq      true          "update income req"
// @Success     200     {object} UpdateIncomeRes      "Success"
// @Failure     500     {object} apperrors.SuitoError "Unknown Error"
// @Router      /income [PUT]
func (s *IncomeController) UpdateIncomeHandler(c echo.Context) error {
	var req UpdateIncomeReq

	if err := c.Bind(&req); err != nil {
		return errors.Wrap(err, "failed bind")
	}
	if err := c.Validate(req); err != nil {
		return err
	}

	uid := c.Get(middleware.UIDKey).(string)
	updatedIncome, err := s.service.UpdateIncomeService(uid, req.Income)
	if err != nil {
		return err
	}

	var res UpdateIncomeRes
	res.UpdatedIncome = updatedIncome

	return webutils.Response(c, http.StatusOK, res)
}
