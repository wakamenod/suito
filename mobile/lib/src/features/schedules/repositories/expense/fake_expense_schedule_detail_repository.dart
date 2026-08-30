import 'package:suito/src/features/schedules/repositories/fake_schedules_repository.dart';
import 'package:suito/src/models/expense_schedule.dart';

import 'expense_schedule_detail_repository.dart';

class FakeExpenseScheduleDetailRepository
    implements ExpenseScheduleDetailRepository {
  FakeExpenseScheduleDetailRepository();

  @override
  Future<ExpenseSchedule> fetchExpenseScheduleDetail(String id) async {
    final f = kFakeExpenseSchedules.firstWhere((el) => el.id == id);
    return ExpenseSchedule(
      id: f.id,
      title: f.title,
      amount: f.amount,
      memo: f.memo,
      expenseCategoryId: f.categoryID,
      expenseLocationId: f.locationID,
    );
  }
}
