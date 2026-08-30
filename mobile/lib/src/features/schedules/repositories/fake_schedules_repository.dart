import 'package:suito/src/features/schedules/repositories/schedules_repository.dart';
import 'package:suito/src/models/transaction.dart';

const kFakeExpenseSchedules = [
  FakeScheduleItem('ID1', 'Amazon 定期購読', 10000, '娯楽費', 'Amazon', 'Memo1'),
  FakeScheduleItem('ID2', '電車賃', 30000, '交通費', '', 'Memo2'),
];
const kFakeIncomeSchedules = [
  FakeScheduleItem('ID3', '給与', 200000, '', '', 'Memo3'),
];

class FakeScheduleItem {
  final String id;
  final String title;
  final int amount;
  final String categoryID;
  final String locationID;
  final String memo;

  const FakeScheduleItem(this.id, this.title, this.amount, this.categoryID,
      this.locationID, this.memo);
}

TransactionSchedule _asSchedule(FakeScheduleItem e) =>
    TransactionSchedule(id: e.id, title: e.title, amount: e.amount);

final kFakeSchedulesResponse = TransactionSchedules(
  expenseSchedules: kFakeExpenseSchedules.map(_asSchedule).toList(),
  incomeSchedules: kFakeIncomeSchedules.map(_asSchedule).toList(),
);

class FakeSchedulesRepository implements SchedulesRepository {
  FakeSchedulesRepository();

  @override
  Future<TransactionSchedules> fetchSchedulesList() async {
    return kFakeSchedulesResponse;
  }
}
