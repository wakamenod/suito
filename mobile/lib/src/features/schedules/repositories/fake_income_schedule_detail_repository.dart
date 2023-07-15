import 'package:openapi/openapi.dart';
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
  Future<IncomeScheduleDetailRes> fetchIncomeScheduleDetail(String id) async {
    final f = kFakeIncomeSchedules.firstWhere((el) => el.id == id);
    return Future.value(IncomeScheduleDetailRes((b) => b
      ..incomeSchedule.replace(ModelIncomeSchedule((s) => s
            ..id = f.id
            ..amount = f.amount
            ..memo = f.memo
          // TODO
          // ..incomeType.replace(ModelIncomeType((c) => c..name = f.title))
          ))));
  }
}
