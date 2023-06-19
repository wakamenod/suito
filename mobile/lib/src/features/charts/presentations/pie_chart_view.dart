import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/features/charts/services/pie_chart.dart';
import 'package:suito/src/features/charts/services/pie_chart_service.dart';
import 'package:suito/src/utils/currency_formatter.dart';
import 'package:suito/src/utils/datetime_utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PieChartView extends ConsumerWidget {
  const PieChartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartDataValue = ref.watch(pieChartControllerProvider);
    final currencyFormatter = ref.watch(currencyFormatterProvider);

    return AsyncValueWidget<PieChart>(
        value: chartDataValue,
        data: (chartData) {
          return Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () async {
                            final newDateRange = await showDateRangePicker(
                                context: context,
                                initialDateRange: chartData.dateRange,
                                firstDate: DateTime(DateTime.now().year - 10),
                                lastDate: DateTime(DateTime.now().year + 3));
                            ref
                                .read(pieChartControllerProvider.notifier)
                                .updateDateRange(newDateRange);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Column(
                            children: [
                              Text(chartData.dateRange.start.toYMD()),
                              Text('~${chartData.dateRange.end.toYMD()}'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  ToggleSwitch(
                    minWidth: 90.0,
                    cornerRadius: 20.0,
                    activeBgColors: [
                      [Colors.green[800]!],
                      [Colors.red[800]!]
                    ],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    initialLabelIndex: chartData.type.index,
                    totalSwitches: 2,
                    labels: const ['Category', 'Location'],
                    radiusStyle: true,
                    onToggle: (index) {
                      ref
                          .read(pieChartControllerProvider.notifier)
                          .updateType(index);
                    },
                  )
                ],
              ),
              Expanded(
                child: Center(
                    child: SfCircularChart(
                        legend: Legend(isVisible: true),
                        // Enables the tooltip for all the series in chart
                        // tooltipBehavior: _tooltipBehavior,
                        series: <CircularSeries<PieChartData, String>>[
                      // Initialize line series
                      PieSeries<PieChartData, String>(
                          // Enables the tooltip for individual series
                          enableTooltip: true,
                          dataSource: chartData.currentTypeData,
                          xValueMapper: (PieChartData data, _) => data.name,
                          yValueMapper: (PieChartData data, _) => data.amount,
                          dataLabelMapper: (PieChartData data, _) =>
                              '${data.name}\n${currencyFormatter.format(data.amount)}',
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true)),
                    ])),
              ),
            ],
          );
        });
  }
}
