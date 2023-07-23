import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/features/schedules/services/schedule_service.dart';

import 'schedules_expense_list_header.dart';
import 'schedules_expense_list_item.dart';
import 'schedules_income_list_header.dart';
import 'schedules_income_list_item.dart';

class SchedulesList extends ConsumerWidget {
  const SchedulesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedulesValue = ref.watch(fetchSchedulesProvider);

    return AsyncValueWidget<List<List<TransactionSchedule>>>(
      value: schedulesValue,
      data: (schedules) => ListView.builder(
        itemCount: schedules.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Column(
            children: <Widget>[
              index == 0
                  ? const SchedulesExpenseListHeader()
                  : const SchedulesIncomeListHeader(),
              ...schedules[index]
                  .map<Widget>(
                    (item) => index == 0
                        ? SchedulesExpenseListItem(item: item)
                        : SchedulesIncomeListItem(item: item),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
