// Port of the Go `chart_service_test.go` cases: the month-axis padding and
// category ordering that `buildColumnChart` took over from `groupByCategory`.

import 'package:flutter_test/flutter_test.dart';
import 'package:suito/src/features/charts/repositories/column_chart_data_repository.dart';

ColumnChartRow _row(String type, String category, String month, int amount) => (
      transactionType: type,
      categoryName: category,
      month: month,
      amount: amount,
    );

void main() {
  group('buildColumnChart', () {
    test('pads a category with null in months it has no transaction in', () {
      final res = buildColumnChart([
        _row('expense', 'Food', '2023-05', 200),
        _row('expense', 'Food', '2023-06', 200),
        _row('expense', '', '2023-04', 400),
      ]);

      expect(res.expenseData.length, 2);

      // Categories are ordered by name descending, so 'Food' comes before ''.
      final food = res.expenseData[0];
      expect(food.categoryName, 'Food');
      expect(food.columnChartData.map((d) => d.month),
          ['2023-04', '2023-05', '2023-06']);
      expect(food.columnChartData.map((d) => d.amount), [null, 200, 200]);

      final uncategorized = res.expenseData[1];
      expect(uncategorized.categoryName, '');
      expect(uncategorized.columnChartData.map((d) => d.amount),
          [400, null, null]);
    });

    test('expense and income share one sorted month axis', () {
      final res = buildColumnChart([
        _row('expense', 'Food', '2023-05', 200),
        _row('expense', 'Food', '2023-06', 200),
        _row('income', 'Salary', '2023-05', 200),
        _row('income', '', '2019-05', 400),
      ]);

      const axis = ['2019-05', '2023-05', '2023-06'];
      for (final series in [...res.expenseData, ...res.incomeData]) {
        expect(series.columnChartData.map((d) => d.month), axis,
            reason: '${series.categoryName} must use the shared month axis');
      }
      expect(res.incomeData.map((s) => s.categoryName), ['Salary', '']);
    });

    test('splits the rows by transaction type', () {
      final res = buildColumnChart([
        _row('expense', 'Food', '2023-05', 200),
        _row('income', 'Salary', '2023-05', 900),
      ]);

      expect(res.expenseData.single.categoryName, 'Food');
      expect(res.expenseData.single.columnChartData.single.amount, 200);
      expect(res.incomeData.single.categoryName, 'Salary');
      expect(res.incomeData.single.columnChartData.single.amount, 900);
    });

    test('is empty for no rows', () {
      final res = buildColumnChart([]);
      expect(res.expenseData, isEmpty);
      expect(res.incomeData, isEmpty);
    });
  });
}
