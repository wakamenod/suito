import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/features/charts/services/column_chart_service.dart';
import 'package:suito/src/utils/currency_formatter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChartView extends ConsumerWidget {
  const ColumnChartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formatter = ref.watch(currencyFormatterProvider);
    final chartDataValue = ref.watch(fetchColumnChartDataProvider);

    return AsyncValueWidget<GetColumnChartDataRes>(
        value: chartDataValue,
        data: (chartData) {
          // print(chartData.expenseData.first.categoryName);
          return Scaffold(
              body: Center(
                  child: SfCartesianChart(
                      legend: Legend(
                          isVisible: true,
                          overflowMode: LegendItemOverflowMode.wrap),
                      // onTooltipRender: (TooltipArgs args) {
                      //   // print('pointIndex:${args.pointIndex}, seriesIndex:${args.seriesIndex}');
                      //   // TODO ここでヘッダーにトータルを入れるか検討
                      //   args.header = 'header';
                      //   // args.text = 'text\nnewlinn';
                      // },
                      tooltipBehavior: TooltipBehavior(
                          // Templating the tooltip
                          // builder: (dynamic data, dynamic point, dynamic series,
                          //     int pointIndex, int seriesIndex) {
                          //   final chartData = data as ChartData;
                          //   return SizedBox(
                          //       height: 20,
                          //       child: Text(
                          //         'Total : ${formatter.format(chartData.expenseTotal)}',
                          //         style: const TextStyle(color: Colors.white),
                          //       ));
                          // },
                          shared: true,
                          enable: true,
                          duration: 10000,
                          textStyle: const TextStyle(
                              fontFamily: 'NotoSerifJP', fontSize: 9),
                          tooltipPosition: TooltipPosition.auto),
                      zoomPanBehavior: ZoomPanBehavior(
                          enablePanning: true,
                          // enablePinching: true,
                          zoomMode: ZoomMode.x),
                      primaryYAxis: NumericAxis(
                        // interval: 10000,
                        majorGridLines: const MajorGridLines(width: 0),
                        labelStyle: const TextStyle(
                            color: Color(0xFF71AF99),
                            fontSize: 13,
                            fontFamily: 'NotoSerifJP'),
                        minimum: 0,
                        numberFormat: formatter,
                      ),
                      primaryXAxis: DateTimeCategoryAxis(
                          autoScrollingDelta: 5,
                          // majorGridLines: const MajorGridLines(width: 0),
                          // labelIntersectAction: AxisLabelIntersectAction.hide,
                          // labelRotation: 270,
                          labelAlignment: LabelAlignment.center,
                          dateFormat: DateFormat.yM(
                              Localizations.localeOf(context).toLanguageTag()),
                          autoScrollingDeltaType: DateTimeIntervalType.months,
                          maximumLabels: 7),
                      series: <ChartSeries<ColumnChartData, DateTime>>[
                for (var data in chartData.expenseData)
                  StackedColumnSeries<ColumnChartData, DateTime>(
                      legendIconType: LegendIconType.rectangle,
                      groupName: 'GroupExpense',
                      dataLabelSettings: const DataLabelSettings(
                          isVisible: false, showCumulativeValues: true),
                      dataSource: data.columnChartData.toList(),
                      name: data.categoryName,
                      xValueMapper: (ColumnChartData value, _) => DateTime(
                          int.parse(value.month.split('-')[0]),
                          int.parse(value.month.split('-')[1])),
                      yValueMapper: (ColumnChartData value, _) => value.amount),
                for (var data in chartData.incomeData)
                  StackedColumnSeries<ColumnChartData, DateTime>(
                      legendIconType: LegendIconType.circle,
                      groupName: 'GroupIncome',
                      dataLabelSettings: const DataLabelSettings(
                          isVisible: false, showCumulativeValues: false),
                      dataSource: data.columnChartData.toList(),
                      name: data.categoryName,
                      xValueMapper: (ColumnChartData value, _) => DateTime(
                          int.parse(value.month.split('-')[0]),
                          int.parse(value.month.split('-')[1])),
                      yValueMapper: (ColumnChartData value, _) => value.amount),
              ])));
        });
  }
}
