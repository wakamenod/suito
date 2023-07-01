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

type IncomeTypeController struct {
	service services.IncomeTypeService
}

func NewIncomeTypeController(s services.IncomeTypeService) *IncomeTypeController {
	return &IncomeTypeController{service: s}
}

type (
	ListIncomeTypesRes struct {
		IncomeTypes []model.IncomeType `json:"incomeTypes"`
	} // @Name ListIncomeTypesRes

	RegisterIncomeTypeReq struct {
		IncomeType model.IncomeType `json:"IncomeType" validate:"required"`
	} // @Name RegisterIncomeTypeReq
	RegisterIncomeTypeRes struct {
		NewIncomeType model.IncomeType `json:"newIncomeType"`
	} // @Name RegisterIncomeTypeRes
)

// @Summary     List income types
// @Description 収入種別一覧を返却します.
// @Tags        suito.income
// @ID          listIncomeTypes
// @Accept      json
// @Produce     json
// @Success     200 {object}  ListIncomeTypesRes   "Success"
// @Failure     500 {object}  apperrors.SuitoError "Unknown Error"
// @Router      /income/types [GET]
func (s *IncomeTypeController) IncomeTypesHandler(c echo.Context) error {
	var res ListIncomeTypesRes

	uid := c.Get(middleware.UIDKey).(string)

	categories, err := s.service.ListIncomeTypesService(uid)
	if err != nil {
		return err
	}
	res.IncomeTypes = categories

	return webutils.Response(c, http.StatusOK, res)
}

// @Summary     Register income incomeType
// @Description 収入種別を登録します
// @Tags        suito.incomeType
// @ID          registerIncomeType
// @Accept      json
// @Produce     json
// @Param       request body     RegisterIncomeTypeReq   true           "register incomeType req"
// @Success     200     {object} RegisterIncomeTypeRes   "Success"
// @Failure     500     {object} apperrors.SuitoError    "Unknown Error"
// @Router      /income/types [POST]
func (s *IncomeTypeController) RegisterIncomeTypeHandler(c echo.Context) error {
	var req RegisterIncomeTypeReq

	if err := c.Bind(&req); err != nil {
		return errors.Wrap(err, "failed bind")
	}
	if err := c.Validate(req); err != nil {
		return err
	}

	uid := c.Get(middleware.UIDKey).(string)
	newIncomeType, err := s.service.CreateIncomeTypeService(uid, req.IncomeType)
	if err != nil {
		return err
	}

	var res RegisterIncomeTypeRes
	res.NewIncomeType = newIncomeType

	return webutils.Response(c, http.StatusOK, res)
}