package controllers

import (
	"net/http"
	"time"

	"github.com/jinzhu/now"
	"github.com/labstack/echo/v4"
	cservices "github.com/wakamenod/suito/api/controllers/services"
	"github.com/wakamenod/suito/api/repositories"
	"github.com/wakamenod/suito/api/services"
	"github.com/wakamenod/suito/apperrors"
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

	GetPieChartDataRes struct {
		CategoryData []repositories.PieChartData `json:"categoryData"`
		LocationData []repositories.PieChartData `json:"locationData"`
	} // @Name GetPieChartDataRes
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

// @Summary     Get pie chart data
// @Description 円グラフデータを取得します
// @Tags        suito.chart
// @ID          getPieChartData
// @Accept      json
// @Produce     json
// @Param       start query     string                true          "Range start (YYYY-MM-DD)"
// @Param       end   query     string                true          "Range end (YYYY-MM-DD)"
// @Success     200   {object}  GetPieChartDataRes   "Success"
// @Failure     500   {object}  apperrors.SuitoError "Unknown Error"
// @Router      /chart/pie [GET]
func (s *ChartController) PieChartHandler(c echo.Context) error {
	var res GetPieChartDataRes

	start, err := now.ParseInLocation(time.UTC, c.QueryParam("start"))
	if err != nil {
		return apperrors.InvalidParameter.Wrap(err)
	}
	end, err := now.ParseInLocation(time.UTC, c.QueryParam("end"))
	if err != nil {
		return apperrors.InvalidParameter.Wrap(err)
	}
	uid := c.Get(middleware.UIDKey).(string)

	category, location, err := s.service.PieChartService(uid, &start, &end)
	if err != nil {
		return err
	}
	res.CategoryData = category
	res.LocationData = location

	return webutils.Response(c, http.StatusOK, res)
}
