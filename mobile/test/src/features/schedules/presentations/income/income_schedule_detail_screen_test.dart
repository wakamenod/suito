import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/transactions/services/income/income_form_value.dart';

import '../../schedules_robot.dart';

void main() {
  // TODO エラー時の表示テスト追加

  group('IncomeScheduleDetail Golden test group', () {
    testGoldens('Open IncomeDetailView as registration for new income',
        (tester) async {
      await loadAppFonts();
      final r = SchedulesRobot(tester);
      final now = DateTime(2023, 5, 1);
      final income = IncomeFormValue.newIncome(now);
      await r.pumpIncomeDetailScreen(income);
      await screenMatchesGolden(tester, 'new_income_schedule_detail');
    });

    testGoldens(
        'Open IncomeScheduleDetailView for updating a registered income schedule',
        (tester) async {
      await loadAppFonts();
      final r = SchedulesRobot(tester);
      const id = 'income_schedule_id';
      final incomeType = ModelIncomeType((e) => e
        ..id = 'income_type_id'
        ..name = 'Test Income Type');
      final incomeTypeMap = {incomeType.id: incomeType};
      final res = IncomeScheduleDetailRes(
          (r) => r.incomeSchedule.replace(ModelIncomeSchedule((b) => b
            ..id = id
            ..timezone = 'Asia/Tokyo'
            ..incomeTypeId = incomeType.id
            ..memo = 'Some memo'
            ..amount = 400)));

      final income = IncomeFormValue.fromSchedule(res, incomeTypeMap);
      await r.pumpIncomeDetailScreen(income);
      await screenMatchesGolden(tester, 'update_income_schedule_detail');
    });
  });
}
