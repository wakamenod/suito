import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/src/features/charts/services/pie_chart_service.dart';

class PieChartView extends ConsumerWidget {
  const PieChartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateRangeValue = ref.watch(pieChartDateRangeProvider);

    return Column(
      children: [
        IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () async {
            final newDateRange = await showDateRangePicker(
                context: context,
                initialDateRange: dateRangeValue,
                firstDate: DateTime(DateTime.now().year - 10),
                lastDate: DateTime(DateTime.now().year + 3));
            ref.read(pieChartDateRangeProvider.notifier).update(newDateRange);
          },
        ),
        // Other content of your widget...
        const Expanded(child: Placeholder()),
      ],
    );
  }
}
