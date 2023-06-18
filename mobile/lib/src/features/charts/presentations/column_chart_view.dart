import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:suito/src/features/charts/repositories/fake_column_chart_data_repository.dart';
import 'package:suito/src/utils/currency_formatter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChartView extends ConsumerWidget {
  const ColumnChartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formatter = ref.watch(currencyFormatterProvider);

    final expenseChartData =
        FakeColumnChartDataRepository().getColumnChartExpenseDataList();
    final incomeChartData =
        FakeColumnChartDataRepository().getColumnChartIncomeDataList();

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
                  labelStyle:
                      const TextStyle(color: Color(0xFF71AF99), fontSize: 13),
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
                series: <ChartSeries<MonthValue, DateTime>>[
          for (var data in expenseChartData)
            StackedColumnSeries<MonthValue, DateTime>(
                groupName: 'GroupA',
                dataLabelSettings: const DataLabelSettings(
                    isVisible: true, showCumulativeValues: true),
                dataSource: data.monthValues,
                name: data.categoryName,
                xValueMapper: (MonthValue value, _) => DateTime(
                    int.parse(value.yearMonth.split('-')[0]),
                    int.parse(value.yearMonth.split('-')[1])),
                yValueMapper: (MonthValue value, _) => value.amount),
          for (var data in incomeChartData)
            StackedColumnSeries<MonthValue, DateTime>(
                groupName: 'GroupB',
                dataLabelSettings: const DataLabelSettings(
                    isVisible: true, showCumulativeValues: true),
                dataSource: data.monthValues,
                name: data.categoryName,
                xValueMapper: (MonthValue value, _) => DateTime(
                    int.parse(value.yearMonth.split('-')[0]),
                    int.parse(value.yearMonth.split('-')[1])),
                yValueMapper: (MonthValue value, _) => value.amount),
        ])));
  }
}
