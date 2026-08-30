// Chart repositories against a LOCAL Supabase stack: the aggregation now lives
// in the `column_chart_data` / `pie_chart_data` SQL functions, so these check
// the RPC contract as well as the Dart grouping on top of it.
@Tags(['supabase'])
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:suito/src/features/charts/repositories/column_chart_data_repository.dart';
import 'package:suito/src/features/charts/repositories/pie_chart_data_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/income_types/register_income_type_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/locations/register_location_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/categories/register_category_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/delete_expense_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/register_expense_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/register_income_repository.dart';
import 'package:suito/src/models/expense.dart';
import 'package:suito/src/models/income.dart';

import 'supabase_test_stack.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(initSupabaseForTests);
  setUp(signUpFreshUser);

  late final columnChart = ColumnChartDataRepository(supabase);
  late final pieChart = PieChartDataRepository(supabase);
  late final registerExpense = RegisterExpenseRepository(supabase);
  late final deleteExpense = DeleteExpenseRepository(supabase);
  late final registerIncome = RegisterIncomeRepository(supabase);
  late final registerCategory = RegisterCategoryRepository(supabase);
  late final registerLocation = RegisterLocationRepository(supabase);
  late final registerIncomeType = RegisterIncomeTypeRepository(supabase);

  group('column chart', () {
    test('sums per category per month and pads the shared axis', () async {
      final food = await registerCategory.registerCategory(uniqueName('Food'));
      final type = await registerIncomeType.registerIncomeType(uniqueName('T'));

      await registerExpense.registerExpense(Expense(
          title: 'a',
          amount: 100,
          expenseCategoryId: food.id,
          localDate: '2023-05-01'));
      await registerExpense.registerExpense(Expense(
          title: 'b',
          amount: 200,
          expenseCategoryId: food.id,
          localDate: '2023-05-20'));
      // June has income only, so May must be padded on the income side and
      // June on the expense side.
      await registerIncome.registerIncome(
          Income(amount: 900, incomeTypeId: type.id, localDate: '2023-06-01'));

      final res = await columnChart.fetchColumnChartData();

      final expense = res.expenseData.single;
      expect(expense.categoryName, food.name);
      expect(
          expense.columnChartData.map((d) => d.month), ['2023-05', '2023-06']);
      expect(expense.columnChartData.map((d) => d.amount), [300, null]);

      final income = res.incomeData.single;
      expect(income.categoryName, type.name);
      expect(income.columnChartData.map((d) => d.amount), [null, 900]);
    });

    test('reports an uncategorized expense under the empty name', () async {
      await registerExpense.registerExpense(
          const Expense(title: 'a', amount: 100, localDate: '2023-05-01'));

      final res = await columnChart.fetchColumnChartData();

      expect(res.expenseData.single.categoryName, '');
      expect(res.expenseData.single.columnChartData.single.amount, 100);
    });

    test('excludes soft-deleted rows', () async {
      final created = await registerExpense.registerExpense(
          const Expense(title: 'a', amount: 100, localDate: '2023-05-01'));
      await deleteExpense.deleteExpense(created.id);

      final res = await columnChart.fetchColumnChartData();

      expect(res.expenseData, isEmpty);
    });

    test('is empty for a new user', () async {
      final res = await columnChart.fetchColumnChartData();
      expect(res.expenseData, isEmpty);
      expect(res.incomeData, isEmpty);
    });
  });

  group('pie chart', () {
    test('sums the range by category and by location', () async {
      final food = await registerCategory.registerCategory(uniqueName('Food'));
      final store =
          await registerLocation.registerLocation(uniqueName('Store'));

      await registerExpense.registerExpense(Expense(
          title: 'a',
          amount: 100,
          expenseCategoryId: food.id,
          expenseLocationId: store.id,
          localDate: '2023-05-02'));
      await registerExpense.registerExpense(Expense(
          title: 'b',
          amount: 200,
          expenseCategoryId: food.id,
          localDate: '2023-05-03'));

      final res = await pieChart.fetchPieChartData('2023-05-01', '2023-06-01');

      expect(res.categoryData.single.name, food.name);
      expect(res.categoryData.single.amount, 300);
      // The uncategorized-location slice sorts after the named one (name desc).
      expect(res.locationData.map((d) => d.name), [store.name, '']);
      expect(res.locationData.map((d) => d.amount), [100, 200]);
    });

    test('is half open: the end date itself is excluded', () async {
      // Same as the Go handler, which parsed `end` as midnight and compared
      // `local_date < end`.
      await registerExpense.registerExpense(const Expense(
          title: 'on the end date', amount: 100, localDate: '2023-05-31'));

      final inside =
          await pieChart.fetchPieChartData('2023-05-01', '2023-06-01');
      final excluded =
          await pieChart.fetchPieChartData('2023-05-01', '2023-05-31');

      expect(inside.categoryData.single.amount, 100);
      expect(excluded.categoryData, isEmpty);
    });

    test('ignores income', () async {
      final type = await registerIncomeType.registerIncomeType(uniqueName('T'));
      await registerIncome.registerIncome(
          Income(amount: 900, incomeTypeId: type.id, localDate: '2023-05-10'));

      final res = await pieChart.fetchPieChartData('2023-05-01', '2023-06-01');

      expect(res.categoryData, isEmpty);
      expect(res.locationData, isEmpty);
    });

    test('excludes soft-deleted rows', () async {
      final created = await registerExpense.registerExpense(
          const Expense(title: 'a', amount: 100, localDate: '2023-05-10'));
      await deleteExpense.deleteExpense(created.id);

      final res = await pieChart.fetchPieChartData('2023-05-01', '2023-06-01');

      expect(res.categoryData, isEmpty);
    });
  });
}
