import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_value.dart';

import '../../schedules_robot.dart';

void main() {
  // TODO エラー時の表示テスト追加

  group('ExpenseScheduleDetail Golden test group', () {
    testGoldens('Open ExpenseDetailView as registration for new expense',
        (tester) async {
      await loadAppFonts();
      final r = SchedulesRobot(tester);
      final now = DateTime(2023, 5, 1);
      final expense = ExpenseFormValue.newExpense(now);
      await r.pumpExpenseDetailScreen(expense);
      await screenMatchesGolden(tester, 'new_expense_schedule_detail');
    });

    testGoldens('Open ExpenseScheduleDetailView for updating a registered expense schedule',
        (tester) async {
      await loadAppFonts();
      final r = SchedulesRobot(tester);
      const id = 'expense_schedule_id';
      final category = ModelExpenseCategory((e) => e
        ..id = 'expense_category_id'
        ..name = 'Test Category');
      final categoryMap = {category.id: category};
      final location = ModelExpenseLocation((e) => e
        ..id = 'expense_location_id'
        ..name = 'Test Location');
      final locationMap = {location.id: location};
      final res =
          ExpenseScheduleDetailRes((r) => r.expenseSchedule.replace(ModelExpenseSchedule((b) => b
            ..id = id
            ..timezone = 'Asia/Tokyo'
            ..title = 'registered title'
            ..memo = 'Some memo'
            ..amount = 400
            ..expenseCategoryID = category.id
            ..expenseLocationID = location.id)));

      final expense =
          ExpenseFormValue.fromSchedule(res, categoryMap, locationMap);
      await r.pumpExpenseDetailScreen(expense);
      await screenMatchesGolden(tester, 'update_expense_schedule_detail');
    });
  });
}
