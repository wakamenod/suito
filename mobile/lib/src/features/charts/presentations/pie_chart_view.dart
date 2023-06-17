import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/src/features/charts/services/pie_chart_service.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PieChartView extends ConsumerWidget {
  const PieChartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateRangeValue = ref.watch(pieChartDateRangeProvider);

    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () async {
                final newDateRange = await showDateRangePicker(
                    context: context,
                    initialDateRange: dateRangeValue,
                    firstDate: DateTime(DateTime.now().year - 10),
                    lastDate: DateTime(DateTime.now().year + 3));
                ref
                    .read(pieChartDateRangeProvider.notifier)
                    .update(newDateRange);
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
              initialLabelIndex: 1,
              totalSwitches: 2,
              labels: const ['Category', 'Location'],
              radiusStyle: true,
              onToggle: (index) {
                // print('switched to: $index');
              },
            )
          ],
        ),
        // Other content of your widget...
        const Expanded(child: Placeholder()),
      ],
    );
  }
}
