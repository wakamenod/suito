import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:suito/src/models/expense_schedule.dart';
import 'package:suito/src/models/transaction_attribute.dart';
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

    testGoldens(
        'Open ExpenseScheduleDetailView for updating a registered expense schedule',
        (tester) async {
      await loadAppFonts();
      final r = SchedulesRobot(tester);
      const id = 'expense_schedule_id';
      const category =
          ExpenseCategory(id: 'expense_category_id', name: 'Test Category');
      final categoryMap = {category.id: category};
      const location =
          ExpenseLocation(id: 'expense_location_id', name: 'Test Location');
      final locationMap = {location.id: location};
      const res = ExpenseSchedule(
        id: id,
        timezone: 'Asia/Tokyo',
        title: 'registered title',
        memo: 'Some memo',
        amount: 400,
        expenseCategoryId: 'expense_category_id',
        expenseLocationId: 'expense_location_id',
      );

      final expense =
          ExpenseFormValue.fromSchedule(res, categoryMap, locationMap);
      await r.pumpExpenseDetailScreen(expense);
      await screenMatchesGolden(tester, 'update_expense_schedule_detail');
    });
  });
}
