package controllers

import (
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/wakamenod/suito/api/controllers/services"
	"github.com/wakamenod/suito/apperrors"
	"github.com/wakamenod/suito/middleware"
	"github.com/wakamenod/suito/utils/dateutils"
	"github.com/wakamenod/suito/utils/webutils"
)

type TransactionController struct {
	service services.TransactionsService
}

func NewTransactionController(s services.TransactionsService) *TransactionController {
	return &TransactionController{service: s}
}

type (
	ListTransactionsRes struct {
		Transactions []services.Transaction `json:"transactions"`
	} // @Name ListTransactionsRes
)

// @Summary     List transactions
// @Description List transactions.
// @Tags        suito.transactions
// @ID          listTransactions
// @Accept      json
// @Produce     json
// @Param       yearMonth     query     string               true  "yearMonth"
// @Success     200           {object}  ListTransactionsRes "Success"
// @Failure     500           {object}  webutils.ErrorRes   "Unknown Error"
// @Router      /transactions [GET]
func (s *TransactionController) TransactionsListHandler(c echo.Context) error {
	var res ListTransactionsRes

	yearMonth := c.QueryParam("yearMonth")
	start, end, err := dateutils.YearMonthDateRange(yearMonth)
	if err != nil {
		return apperrors.InvalidParameter.Wrap(err)
	}
	uid := c.Get(middleware.UIDKey).(string)

	transactions, err := s.service.ListTransactionsService(uid, start, end)
	if err != nil {
		return err
	}
	res.Transactions = transactions

	return webutils.Response(c, http.StatusOK, res)
}
