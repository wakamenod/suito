package controllers

import (
	"net/http"

	"github.com/labstack/echo/v4"
	cservices "github.com/wakamenod/suito/api/controllers/services"
	"github.com/wakamenod/suito/api/services"
	"github.com/wakamenod/suito/middleware"
	"github.com/wakamenod/suito/utils/webutils"
)

type TransactionScheduleController struct {
	service cservices.TransactionScheduleService
}

func NewTransactionScheduleController(s cservices.TransactionScheduleService) *TransactionScheduleController {
	return &TransactionScheduleController{service: s}
}

type (
	ListTransactionSchedulesRes struct {
		ExpenseSchedules []services.TransactionSchedule `json:"expenseSchedules"`
		IncomeSchedules  []services.TransactionSchedule `json:"incomeSchedules"`
	} // @Name ListTransactionSchedulesRes
)

// @Summary     List transaction schedules
// @Description List transactions schedules.
// @Tags        suito.transactionSchedules
// @ID          listTransactionSchedules
// @Accept      json
// @Produce     json
// @Success     200           {object}  ListTransactionSchedulesRes  "Success"
// @Failure     500           {object}  apperrors.SuitoError "Unknown Error"
// @Router      /schedules [GET]
func (s *TransactionScheduleController) TransactionSchedulesListHandler(c echo.Context) error {
	var res ListTransactionSchedulesRes

	uid := c.Get(middleware.UIDKey).(string)

	expenses, incomes, err := s.service.ListTransactionSchedulesService(uid)
	if err != nil {
		return err
	}
	res.ExpenseSchedules = expenses
	res.IncomeSchedules = incomes

	return webutils.Response(c, http.StatusOK, res)
}
