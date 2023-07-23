import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/schedules/repositories/schedules_repository.dart';

part 'schedule_service.g.dart';

@riverpod
Future<List<List<TransactionSchedule>>> fetchSchedules(
    FetchSchedulesRef ref) async {
  final schedulesRepository = ref.read(schedulesRepositoryProvider);
  final res = await schedulesRepository.fetchSchedulesList();
  return [
    res.expenseSchedules.toList(),
    res.incomeSchedules.toList(),
  ];
}
