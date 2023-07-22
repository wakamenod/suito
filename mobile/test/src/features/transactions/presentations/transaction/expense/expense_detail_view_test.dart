import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openapi/openapi.dart';

import '../../../../../mocks.dart';
import '../../../transactions_robot.dart';

void main() {
  // TODO エラー時の表示テスト追加

  group('ExpenseDetailView Golden test group', () {
    testGoldens('Open ExpenseDetailView as registration for new expense',
        (tester) async {
      await loadAppFonts();
      final r = TransactionsRobot(tester);
      final now = DateTime(2023, 5, 1);
      await r.pumpExpenseDetailScreen(id: null, now: now);
      await screenMatchesGolden(tester, 'new_expense_detail');
    });
  });

  testGoldens('Open ExpenseDetailView for updating a registered expense',
      (tester) async {
    await loadAppFonts();
    final r = TransactionsRobot(tester);
    final now = DateTime(2023, 5, 1);
    final repository = MockExpenseDetailRepository();
    final categoryRepo = MockExpenseCategoriesRepository();
    final locationRepo = MockExpenseLocationsRepository();
    const id = 'expense_id';
    final category = ModelExpenseCategory((e) => e
      ..id = 'expense_category_id'
      ..name = 'Test Category');
    final location = ModelExpenseLocation((e) => e
      ..id = 'expense_location_id'
      ..name = 'Test Location');
    final res = ExpenseDetailRes((r) => r.expense.replace(ModelExpense((b) => b
      ..id = id
      ..title = 'registered title'
      ..localDate = '2023-05-03'
      ..memo = 'Some memo'
      ..amount = 400
      ..expenseCategoryID = category.id
      ..expenseLocationID = location.id)));
    when(() => repository.fetchExpenseDetail(id))
        .thenAnswer((_) => Future.value(res));
    when(() => categoryRepo.fetchExpenseCategoriesList())
        .thenAnswer((invocation) => Future.value([category]));
    when(() => locationRepo.fetchExpenseLocationsList())
        .thenAnswer((invocation) => Future.value([location]));
    await r.pumpExpenseDetailScreen(
        expenseRepo: repository,
        categoryRepo: categoryRepo,
        locationRepo: locationRepo,
        id: id,
        now: now);
    await screenMatchesGolden(tester, 'update_expense_detail');
  });
}
