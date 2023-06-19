package controllers

import (
	"net/http"

	"github.com/labstack/echo/v4"
	cservices "github.com/wakamenod/suito/api/controllers/services"
	"github.com/wakamenod/suito/api/services"
	"github.com/wakamenod/suito/middleware"
	"github.com/wakamenod/suito/utils/webutils"
)

type ChartController struct {
	service cservices.ChartService
}

func NewChartController(s cservices.ChartService) *ChartController {
	return &ChartController{service: s}
}

type (
	GetColumnChartDataRes struct {
		ExpenseData []services.ColumnChartCategoryData `json:"expenseData"`
		IncomeData  []services.ColumnChartCategoryData `json:"incomeData"`
	} // @Name GetColumnChartDataRes

)

// @Summary     Get column chart data
// @Description 棒グラフデータを取得します
// @Tags        suito.chart
// @ID          getColumnChartData
// @Accept      json
// @Produce     json
// @Success     200 {object}  GetColumnChartDataRes "Success"
// @Failure     500 {object}  apperrors.SuitoError "Unknown Error"
// @Router      /chart/column [GET]
func (s *ChartController) ColumnChartHandler(c echo.Context) error {
	var res GetColumnChartDataRes

	uid := c.Get(middleware.UIDKey).(string)

	expense, income, err := s.service.ColumnChartService(uid)
	if err != nil {
		return err
	}
	res.ExpenseData = expense
	res.IncomeData = income

	return webutils.Response(c, http.StatusOK, res)
}
