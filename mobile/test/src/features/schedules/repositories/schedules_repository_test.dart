import 'package:flutter_test/flutter_test.dart';
import 'package:suito/src/features/schedules/repositories/schedules_repository.dart';

void main() {
  group('buildTransactionSchedules', () {
    test('keeps the expense title and borrows the income type name', () {
      final res = buildTransactionSchedules(
        expenseRows: [
          {'id': 'e1', 'title': 'Rent', 'amount': 80000},
        ],
        incomeRows: [
          {'id': 'i1', 'amount': 200000, 'income_type_id': 't1'},
        ],
        incomeTypeNames: {'t1': 'Salary'},
      );

      expect(res.expenseSchedules.single.title, 'Rent');
      expect(res.incomeSchedules.single.title, 'Salary');
      expect(res.incomeSchedules.single.amount, 200000);
    });

    test('leaves the title blank when the income type is gone', () {
      final res = buildTransactionSchedules(
        expenseRows: [],
        incomeRows: [
          {'id': 'i1', 'amount': 1, 'income_type_id': null},
        ],
        incomeTypeNames: const {},
      );

      expect(res.incomeSchedules.single.title, '');
    });

    test('is empty for no rows', () {
      final res = buildTransactionSchedules(
        expenseRows: [],
        incomeRows: [],
        incomeTypeNames: const {},
      );
      expect(res.expenseSchedules, isEmpty);
      expect(res.incomeSchedules, isEmpty);
    });
  });
}
