import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/schedules/repositories/schedules_repository.dart';

part 'schedule_service.g.dart';

class Schedules {
  final String header;
  final Color textColor;
  final List<TransactionSchedule> items;

  Schedules(this.header, this.textColor, this.items);
}

@riverpod
Future<List<Schedules>> fetchSchedules(FetchSchedulesRef ref) async {
  final schedulesRepository = ref.read(schedulesRepositoryProvider);
  final res = await schedulesRepository.fetchSchedulesList();
  // TODO theme
  return [
    Schedules(t.schedules.expansionTile.expenseHeader, Colors.green,
        res.expenseSchedules.toList()),
    Schedules(t.schedules.expansionTile.incomeHeader, Colors.red,
        res.incomeSchedules.toList()),
  ];
}
