import 'package:openapi/openapi.dart';
import 'package:suito/src/features/schedules/repositories/fake_schedules_repository.dart';

import 'expense_schedule_detail_repository.dart';

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
  Future<ExpenseScheduleDetailRes> fetchExpenseScheduleDetail(String id) async {
    final f = kFakeExpenseSchedules.firstWhere((el) => el.id == id);
    return Future.value(ExpenseScheduleDetailRes((b) => b
      ..expenseSchedule.replace(ModelExpenseSchedule((s) => s
        ..id = f.id
        ..title = f.title
        ..amount = f.amount
        ..memo = f.memo
        ..expenseCategoryID = f.categoryID
        ..expenseLocationID = f.locationID))));
  }
}
