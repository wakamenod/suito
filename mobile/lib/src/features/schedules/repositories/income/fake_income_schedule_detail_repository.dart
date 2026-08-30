import 'package:suito/src/features/schedules/repositories/fake_schedules_repository.dart';
import 'package:suito/src/models/income_schedule.dart';

import 'income_schedule_detail_repository.dart';

class FakeIncomeScheduleDetailRepository
    implements IncomeScheduleDetailRepository {
  FakeIncomeScheduleDetailRepository();

  @override
  Future<IncomeSchedule> fetchIncomeScheduleDetail(String id) async {
    final f = kFakeIncomeSchedules.firstWhere((el) => el.id == id);
    return IncomeSchedule(id: f.id, amount: f.amount, memo: f.memo);
  }
}
