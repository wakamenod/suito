package transactions

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

type (
	ErrorInfo struct {
		Code    string `json:"code"`
		Message string `json:"message"`
		Status  int    `json:"-"`
	} //@name ErrorInfo

	ErrorRes struct {
		ErrorInfo *ErrorInfo `json:"errorInfo"`
	} //@name ErrorRes

	Transaction struct {
		ID     string `json:"id"`
		Title  string `json:"title"`
		Amount int    `json:"amount"`
		Type   int    `json:"type" enums:"1,2"`
	}

	ListTransactionsRes struct {
		Transactions []Transaction `json:"transactions"`
	}
)

// @Summary     List transactions
// @Description List transactions.
// @Tags        suito.transactions
// @ID          listTransactions
// @Accept      json
// @Produce     json
// @Param       yearMonth     query     string              true  "yearMonth"
// @Success     200           {object}  ListTransactionsRes "成功"
// @Failure     500           {object}  ErrorRes            "未知のエラー"
// @Router      /transactions [GET]
func list(c echo.Context) error {
	var res ListTransactionsRes
	res.Transactions = []Transaction{
		{
			ID:     "XXX",
			Title:  "Title XXX",
			Amount: 111,
			Type:   1,
		},
		{
			ID:     "YYY",
			Title:  "Title YYY",
			Amount: 222,
			Type:   2,
		},
		{
			ID:     "ZZZ",
			Title:  "Title ZZZ",
			Amount: 333,
			Type:   1,
		},
	}
	return c.JSON(http.StatusOK, res)
}
