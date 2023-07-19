import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/schedules/repositories/schedules_repository.dart';

import 'expense/delete_expense_schedule_controller.dart';
import 'income/delete_income_schedule_controller.dart';

part 'schedule_service.g.dart';

class Schedules {
  final String headerText;
  final Color mainColor;
  final List<TransactionSchedule> items;
  final Future<void> Function(String id) onDismissed;

  Schedules(
      {required this.headerText,
      required this.mainColor,
      required this.items,
      required this.onDismissed});
}

@riverpod
Future<List<Schedules>> fetchSchedules(FetchSchedulesRef ref) async {
  final schedulesRepository = ref.read(schedulesRepositoryProvider);
  final res = await schedulesRepository.fetchSchedulesList();
  // TODO theme
  return [
    Schedules(
        headerText: t.schedules.expansionTile.expenseHeader,
        mainColor: Colors.red,
        items: res.expenseSchedules.toList(),
        onDismissed: (id) async {
          await ref
              .read(deleteExpenseScheduleControllerProvider.notifier)
              .deleteExpenseSchedule(id);
        }),
    Schedules(
        headerText: t.schedules.expansionTile.incomeHeader,
        mainColor: Colors.green,
        items: res.incomeSchedules.toList(),
        onDismissed: (id) async {
          await ref
              .read(deleteIncomeScheduleControllerProvider.notifier)
              .deleteIncomeSchedule(id);
        }),
  ];
}
