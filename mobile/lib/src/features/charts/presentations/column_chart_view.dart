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
                          tooltipPosition: TooltipPosition.pointer),
                      zoomPanBehavior: ZoomPanBehavior(
                          enablePanning: true,
                          enablePinching: true,
                          zoomMode: ZoomMode.x),
                      primaryYAxis: NumericAxis(
                        // interval: 10000,
                        majorGridLines: const MajorGridLines(width: 0),
                        labelStyle: const TextStyle(
                            color: Color(0xFF71AF99), fontSize: 13),
                        minimum: 0,
                        numberFormat: formatter,
                      ),
                      primaryXAxis: DateTimeCategoryAxis(
                          autoScrollingDelta: 5,
                          // majorGridLines: const MajorGridLines(width: 0),
                          // labelIntersectAction: AxisLabelIntersectAction.hide,
                          // labelRotation: 270,
                          labelAlignment: LabelAlignment.center,
                          dateFormat: DateFormat.yM(),
                          autoScrollingDeltaType: DateTimeIntervalType.months,
                          // visibleMinimum: (chartData.length - 5)
                          //     .toDouble(), // set the visible minimum as the 15 chart data index from the last value.
                          // visibleMaximum: (chartData.length - 1)
                          //     .toDouble(), // set the visible minimum as the last value's chart data index.
                          maximumLabels: 10),
                      series: <ChartSeries<ColumnChartData, DateTime>>[
                for (var data in chartData.expenseData)
                  StackedColumnSeries<ColumnChartData, DateTime>(
                      groupName: 'GroupExpense',
                      dataLabelSettings: const DataLabelSettings(
                          isVisible: true, showCumulativeValues: true),
                      dataSource: data.columnChartData.toList(),
                      name: data.categoryName,
                      xValueMapper: (ColumnChartData value, _) => DateTime(
                          int.parse(value.month.split('-')[0]),
                          int.parse(value.month.split('-')[1])),
                      yValueMapper: (ColumnChartData value, _) => value.amount),
                for (var data in chartData.incomeData)
                  StackedColumnSeries<ColumnChartData, DateTime>(
                      groupName: 'GroupIncome',
                      dataLabelSettings: const DataLabelSettings(
                          isVisible: true, showCumulativeValues: true),
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
