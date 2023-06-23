import 'package:suito/src/features/schedules/repositories/expense_schedule_detail_repository.dart';
import 'package:suito/src/features/schedules/repositories/fake_schedules_repository.dart';

class FakeExpenseScheduleDetailRes {
  final String id;
  final String title;
  final int amount;
  final String category;
  final String location;
  final String memo;

  FakeExpenseScheduleDetailRes(this.id, this.title, this.amount, this.category,
      this.location, this.memo);
}

class FakeExpenseScheduleDetailRepository
    implements ExpenseScheduleDetailRepository {
  FakeExpenseScheduleDetailRepository();

  @override
  Future<FakeExpenseScheduleDetailRes> fetchExpenseScheduleDetail(
      String id) async {
    return Future.value(kFakeSchedulesResponse.expenseSchedules
        .map((m) => FakeExpenseScheduleDetailRes(
            m.id, m.title, m.amount, m.category, m.location, m.memo))
        .firstWhere((s) => s.id == id));
  }
}
