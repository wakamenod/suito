import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/features/charts/services/pie_chart.dart';
import 'package:suito/src/features/charts/services/pie_chart_service.dart';
import 'package:suito/src/utils/currency_formatter.dart';
import 'package:suito/src/utils/datetime_utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Row(
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
                    FlutterToggleTab(
                      width: 40,
                      borderRadius: 10,
                      height: 40,
                      selectedIndex: chartData.type.index,
                      selectedBackgroundColors: const [
                        Colors.blue,
                        Colors.blueAccent
                      ],
                      selectedTextStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                      unSelectedTextStyle: const TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      labels: [
                        t.charts.toggle.category,
                        t.charts.toggle.location
                      ],
                      marginSelected: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 2),
                      selectedLabelIndex: (index) {
                        ref
                            .read(pieChartControllerProvider.notifier)
                            .updateType(index);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                    child: SfCircularChart(
                        legend: Legend(
                          isVisible: true,
                          textStyle: const TextStyle(
                              fontFamily: 'NotoSerifJP', fontSize: 12),
                        ),
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
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                            textStyle: TextStyle(
                                fontFamily: 'NotoSerifJP', fontSize: 12),
                          )),
                    ])),
              ),
            ],
          );
        });
  }
}
