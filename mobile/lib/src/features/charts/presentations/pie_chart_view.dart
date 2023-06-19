import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/features/charts/repositories/fake_pie_chart_data_repository.dart';
import 'package:suito/src/features/charts/services/pie_chart_data.dart';
import 'package:suito/src/features/charts/services/pie_chart_service.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PieChartView extends ConsumerWidget {
  const PieChartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartDataValue = ref.watch(pieChartControllerProvider);

    return AsyncValueWidget<PieChartData>(
        value: chartDataValue,
        data: (chartData) {
          return Column(
            children: [
              Row(
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
                        series: <CircularSeries<FakePieChartData, String>>[
                      // Initialize line series
                      PieSeries<FakePieChartData, String>(
                          // Enables the tooltip for individual series
                          enableTooltip: true,
                          dataSource: chartData.currentTypeData,
                          xValueMapper: (FakePieChartData data, _) => data.name,
                          yValueMapper: (FakePieChartData data, _) =>
                              data.amount,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true)),
                    ])),
              ),
            ],
          );
        });
  }
}
