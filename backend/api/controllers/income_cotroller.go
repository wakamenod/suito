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
)

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
