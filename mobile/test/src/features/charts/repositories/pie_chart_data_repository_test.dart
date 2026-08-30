import 'package:flutter_test/flutter_test.dart';
import 'package:suito/src/features/charts/repositories/pie_chart_data_repository.dart';

void main() {
  group('splitPieChart', () {
    test('splits the rows by dimension, keeping the RPC order', () {
      final res = splitPieChart([
        {'dimension': 'category', 'name': 'Food', 'amount': 300},
        {'dimension': 'category', 'name': '', 'amount': 100},
        {'dimension': 'location', 'name': 'Store', 'amount': 400},
      ]);

      expect(res.categoryData.map((d) => d.name), ['Food', '']);
      expect(res.categoryData.map((d) => d.amount), [300, 100]);
      expect(res.locationData.single.name, 'Store');
      expect(res.locationData.single.amount, 400);
    });

    test('accepts the bigint sums PostgREST sends as num', () {
      final res = splitPieChart([
        {'dimension': 'category', 'name': 'Food', 'amount': 300},
      ]);
      expect(res.categoryData.single.amount, isA<int>());
    });

    test('is empty for no rows', () {
      final res = splitPieChart([]);
      expect(res.categoryData, isEmpty);
      expect(res.locationData, isEmpty);
    });
  });
}
