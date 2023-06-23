import 'package:suito/src/features/schedules/repositories/schedules_repository.dart';

class FakeScheduleResponse {
  final List<FakeScheduleItem> expenseSchedules;
  final List<FakeScheduleItem> incomeSchedules;

  FakeScheduleResponse(this.expenseSchedules, this.incomeSchedules);
}

class FakeScheduleItem {
  final String id;
  final String title;
  final int amount;

  FakeScheduleItem(this.id, this.title, this.amount);
}

final kFakeSchedulesResponse = FakeScheduleResponse([
  FakeScheduleItem('ID1', 'Amazon 定期購読', 10000),
  FakeScheduleItem('ID2', '交通費', 30000),
], [
  FakeScheduleItem('ID3', '給与', 200000),
]);

class FakeSchedulesRepository implements SchedulesRepository {
  FakeSchedulesRepository();

  @override
  Future<FakeScheduleResponse> fetchSchedulesList() async {
    return kFakeSchedulesResponse;
  }
}
