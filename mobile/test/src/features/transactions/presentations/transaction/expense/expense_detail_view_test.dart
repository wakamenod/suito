import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_value.dart';

import '../../../transactions_robot.dart';

void main() {
  // TODO エラー時の表示テスト追加

  group('ExpenseDetailView Golden test group', () {
    testGoldens('Open ExpenseDetailView as registration for new expense',
        (tester) async {
      await loadAppFonts();
      final r = TransactionsRobot(tester);
      final now = DateTime(2023, 5, 1);
      final expense = ExpenseFormValue.newExpense(now);
      await r.pumpExpenseDetailScreen(expense);
      await screenMatchesGolden(tester, 'new_expense_detail');
    });

    testGoldens('Open ExpenseDetailView for updating a registered expense',
        (tester) async {
      await loadAppFonts();
      final r = TransactionsRobot(tester);
      const id = 'expense_id';
      final category = ModelExpenseCategory((e) => e
        ..id = 'expense_category_id'
        ..name = 'Test Category');
      final categoryMap = {category.id: category};
      final location = ModelExpenseLocation((e) => e
        ..id = 'expense_location_id'
        ..name = 'Test Location');
      final locationMap = {location.id: location};
      final res =
          ExpenseDetailRes((r) => r.expense.replace(ModelExpense((b) => b
            ..id = id
            ..title = 'registered title'
            ..localDate = '2023-05-03'
            ..memo = 'Some memo'
            ..amount = 400
            ..expenseCategoryID = category.id
            ..expenseLocationID = location.id)));

      final expense =
          ExpenseFormValue.fromExpense(res, categoryMap, locationMap);
      await r.pumpExpenseDetailScreen(expense);
      await screenMatchesGolden(tester, 'update_expense_detail');
    });

    // GoldenテストではcupertinoフォントはAhemになってしまう
    // READMEによるとSFフォントのファイル(ttf)を取り込みpubspec.yamlで指定すると表示可能
    // ライセンスの考慮が必要なので実施していない
    testGoldens('TransactionDatePicker', (tester) async {
      await loadAppFonts();
      final r = TransactionsRobot(tester);
      final now = DateTime(2023, 5, 1);
      final expense = ExpenseFormValue.newExpense(now);
      await r.pumpExpenseDetailScreen(expense);
      await r.tapDatePicker();
      await screenMatchesGolden(tester, 'date_picker');
    });
  });

  // group('ExpenseDetailView', () {
  //   testWidgets('TransactionDatePicker', (tester) async {
  //     await loadAppFonts();
  //     final r = TransactionsRobot(tester);
  //     final now = DateTime(2023, 5, 1);
  //     final expense = ExpenseFormValue.newExpense(now);
  //     await r.pumpExpenseDetailScreen(expense);
  //     await r.tapDatePicker();
  //     // remove focus from datepicker
  //     await tester.tapAt(const Offset(0, 0));
  //   });
  // });
}
