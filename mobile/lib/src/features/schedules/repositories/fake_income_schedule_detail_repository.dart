import 'package:suito/src/features/schedules/repositories/fake_schedules_repository.dart';
import 'package:suito/src/features/schedules/repositories/income_schedule_detail_repository.dart';

class FakeIncomeScheduleDetailRes {
  final String id;
  final String title;
  final int amount;
  final String memo;

  FakeIncomeScheduleDetailRes(this.id, this.title, this.amount, this.memo);
}

class FakeIncomeScheduleDetailRepository
    implements IncomeScheduleDetailRepository {
  FakeIncomeScheduleDetailRepository();

  @override
  Future<FakeIncomeScheduleDetailRes> fetchIncomeScheduleDetail(
      String id) async {
    return Future.value(kFakeIncomeSchedules
        .map(
            (m) => FakeIncomeScheduleDetailRes(m.id, m.title, m.amount, m.memo))
        .firstWhere((s) => s.id == id));
  }
}
