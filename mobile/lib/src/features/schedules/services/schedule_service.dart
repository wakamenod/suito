import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/schedules/repositories/schedules_repository.dart';

part 'schedule_service.g.dart';

class Schedules {
  final String headerText;
  final Color textColor;
  final List<TransactionSchedule> items;

  Schedules(
      {required this.headerText, required this.textColor, required this.items});
}

@riverpod
class ReloadSchedules extends _$ReloadSchedules {
  @override
  int build() {
    return 0;
  }

  Future<void> reload() async {
    state++;
  }
}

@riverpod
Future<List<Schedules>> fetchSchedules(FetchSchedulesRef ref) async {
  ref.watch(reloadSchedulesProvider);
  final schedulesRepository = ref.read(schedulesRepositoryProvider);
  final res = await schedulesRepository.fetchSchedulesList();
  // TODO theme
  return [
    Schedules(
        headerText: t.schedules.expansionTile.expenseHeader,
        textColor: Colors.green,
        items: res.expenseSchedules.toList()),
    Schedules(
        headerText: t.schedules.expansionTile.incomeHeader,
        textColor: Colors.red,
        items: res.incomeSchedules.toList()),
  ];
}
