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
  final String category;
  final String location;
  final String memo;

  FakeScheduleItem(this.id, this.title, this.amount, this.category,
      this.location, this.memo);
}

final kFakeSchedulesResponse = FakeScheduleResponse([
  FakeScheduleItem('ID1', 'Amazon 定期購読', 10000, '娯楽費', 'Amazon', 'Memo1'),
  FakeScheduleItem('ID2', '電車賃', 30000, '交通費', '', 'Memo2'),
], [
  FakeScheduleItem('ID3', '給与', 200000, '', '', 'Memo3'),
]);

class FakeSchedulesRepository implements SchedulesRepository {
  FakeSchedulesRepository();

  @override
  Future<FakeScheduleResponse> fetchSchedulesList() async {
    return kFakeSchedulesResponse;
  }
}
