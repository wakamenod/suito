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

type ExpenseLocationController struct {
	service services.ExpenseLocationService
}

func NewExpenseLocationController(s services.ExpenseLocationService) *ExpenseLocationController {
	return &ExpenseLocationController{service: s}
}

type (
	ListExpenseLocationsRes struct {
		ExpenseLocations []model.ExpenseLocation `json:"expenseLocations"`
	} // @Name ListExpenseLocationsRes

	RegisterExpenseLocationReq struct {
		ExpenseLocation model.ExpenseLocation `json:"expenseLocation" validate:"required"`
	} // @Name RegisterExpenseLocationReq
	RegisterExpenseLocationRes struct {
		NewExpenseLocation model.ExpenseLocation `json:"newExpenseLocation"`
	} // @Name RegisterExpenseLocationRes

	UpdateExpenseLocationReq struct {
		ExpenseLocation model.ExpenseLocation `json:"expenseLocation" validate:"required"`
	} // @Name UpdateExpenseLocationReq
	UpdateExpenseLocationRes struct {
		UpdatedExpenseLocation model.ExpenseLocation `json:"updatedExpenseLocation"`
	} // @Name UpdateExpenseLocationRes

	DeleteExpenseLocationReq struct {
		ExpenseLocationID string `json:"expenseLocationId" validate:"required"`
	} // @Name DeleteExpenseLocationReq
	DeleteExpenseLocationRes struct {
	} // @Name DeleteExpenseLocationRes
)

// @Summary     List expense locations
// @Description 購入場所ー一覧を返却します.
// @Tags        suito.expense
// @ID          listExpenseLocations
// @Accept      json
// @Produce     json
// @Success     200 {object}  ListExpenseLocationsRes "Success"
// @Failure     500 {object}  apperrors.SuitoError "Unknown Error"
// @Router      /expense/locations [GET]
func (s *ExpenseLocationController) ExpenseLocationsHandler(c echo.Context) error {
	var res ListExpenseLocationsRes

	uid := c.Get(middleware.UIDKey).(string)

	locations, err := s.service.ListExpenseLocationService(uid)
	if err != nil {
		return err
	}
	res.ExpenseLocations = locations

	return webutils.Response(c, http.StatusOK, res)
}

// @Summary     Register expense location
// @Description 支出場所情報を登録します
// @Tags        suito.expenseLocation
// @ID          registerExpenseLocation
// @Accept      json
// @Produce     json
// @Param       request body     RegisterExpenseLocationReq   true           "register expenseLocation req"
// @Success     200     {object} RegisterExpenseLocationRes   "Success"
// @Failure     500     {object} apperrors.SuitoError         "Unknown Error"
// @Router      /expense/locations [POST]
func (s *ExpenseLocationController) RegisterExpenseLocationHandler(c echo.Context) error {
	var req RegisterExpenseLocationReq

	if err := c.Bind(&req); err != nil {
		return errors.Wrap(err, "failed bind")
	}
	if err := c.Validate(req); err != nil {
		return err
	}

	uid := c.Get(middleware.UIDKey).(string)
	newExpenseLocation, err := s.service.CreateExpenseLocationService(uid, req.ExpenseLocation)
	if err != nil {
		return err
	}

	var res RegisterExpenseLocationRes
	res.NewExpenseLocation = newExpenseLocation

	return webutils.Response(c, http.StatusOK, res)
}

// @Summary     Update expense location
// @Description 支出場所情報を更新します
// @Tags        suito.expenseLocation
// @ID          updateExpenseLocation
// @Accept      json
// @Produce     json
// @Param       request body     UpdateExpenseLocationReq   true           "update expenseLocation req"
// @Success     200     {object} UpdateExpenseLocationRes   "Success"
// @Failure     500     {object} apperrors.SuitoError       "Unknown Error"
// @Router      /expense/locations [PUT]
func (s *ExpenseLocationController) UpdateExpenseLocationHandler(c echo.Context) error {
	var req UpdateExpenseLocationReq

	if err := c.Bind(&req); err != nil {
		return errors.Wrap(err, "failed bind")
	}
	if err := c.Validate(req); err != nil {
		return err
	}

	uid := c.Get(middleware.UIDKey).(string)
	expenseLocation, err := s.service.UpdateExpenseLocationService(uid, req.ExpenseLocation)
	if err != nil {
		return err
	}

	var res UpdateExpenseLocationRes
	res.UpdatedExpenseLocation = expenseLocation

	return webutils.Response(c, http.StatusOK, res)
}

// @Summary     Delete expense location
// @Description 支出場所情報を削除します
// @Tags        suito.expenseLocation
// @ID          deleteExpenseLocation
// @Accept      json
// @Produce     json
// @Param       request body     DeleteExpenseLocationReq   true           "delete expenseLocation req"
// @Success     200     {object} DeleteExpenseLocationRes   "Success"
// @Failure     500     {object} apperrors.SuitoError       "Unknown Error"
// @Router      /expense/locations [DELETE]
func (s *ExpenseLocationController) DeleteExpenseLocationHandler(c echo.Context) error {
	var req DeleteExpenseLocationReq

	if err := c.Bind(&req); err != nil {
		return errors.Wrap(err, "failed bind")
	}
	if err := c.Validate(req); err != nil {
		return err
	}

	uid := c.Get(middleware.UIDKey).(string)
	err := s.service.DeleteExpenseLocationService(req.ExpenseLocationID, uid)
	if err != nil {
		return err
	}

	var res DeleteExpenseLocationRes
	return webutils.Response(c, http.StatusOK, res)
}
