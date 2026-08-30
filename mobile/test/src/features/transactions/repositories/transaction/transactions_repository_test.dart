// Unit tests for the two pure pieces of the transaction list that moved from
// the Go backend into Dart: the month -> date-range translation and the
// expense + income merge (`ListTransactionsService`).

import 'package:flutter_test/flutter_test.dart';
import 'package:suito/src/features/transactions/repositories/transaction/transactions_repository.dart';
import 'package:suito/src/models/expense.dart';
import 'package:suito/src/models/income.dart';

const _expenseType = 1;
const _incomeType = 2;

void main() {
  group('monthRange', () {
    test('covers the month half-openly', () {
      expect(monthRange('2023-05'), (start: '2023-05-01', end: '2023-06-01'));
    });

    test('rolls over the year at december', () {
      expect(monthRange('2023-12'), (start: '2023-12-01', end: '2024-01-01'));
    });

    test('is null for anything unparsable', () {
      // The year-month selector starts out empty.
      expect(monthRange(''), isNull);
      expect(monthRange('202305'), isNull);
      expect(monthRange('nope'), isNull);
    });
  });

  group('mergeTransactions', () {
    test('tags each side with its transaction type', () {
      final res = mergeTransactions(
        expenses: [
          const Expense(
              id: 'e1', title: 'Rent', amount: 100, localDate: '2023-05-02'),
        ],
        incomes: [
          const Income(
              id: 'i1',
              amount: 200,
              incomeTypeId: 't1',
              localDate: '2023-05-01'),
        ],
        incomeTypeNames: {'t1': 'Salary'},
      );

      expect(res.map((t) => t.type), [_expenseType, _incomeType]);
    });

    test('titles an income row with its income type name', () {
      final res = mergeTransactions(
        expenses: [],
        incomes: [
          const Income(
              id: 'i1',
              amount: 200,
              incomeTypeId: 't1',
              localDate: '2023-05-01'),
        ],
        incomeTypeNames: {'t1': 'Salary'},
      );

      expect(res.single.title, 'Salary');
    });

    test('leaves the title blank when the income type is gone', () {
      // `on delete set null` detaches the income when its type is deleted.
      final res = mergeTransactions(
        expenses: [],
        incomes: [const Income(id: 'i1', amount: 200, localDate: '2023-05-01')],
        incomeTypeNames: const {},
      );

      expect(res.single.title, '');
    });

    test('sorts newest first, id descending within a day', () {
      final res = mergeTransactions(
        expenses: [
          const Expense(
              id: 'a', title: 'older', amount: 1, localDate: '2023-05-01'),
          const Expense(
              id: 'c',
              title: 'same day, higher id',
              amount: 1,
              localDate: '2023-05-02'),
        ],
        incomes: [
          const Income(
              id: 'b', amount: 1, incomeTypeId: 't1', localDate: '2023-05-02'),
          const Income(
              id: 'd', amount: 1, incomeTypeId: 't1', localDate: '2023-05-03'),
        ],
        incomeTypeNames: {'t1': 'Salary'},
      );

      expect(res.map((t) => t.id), ['d', 'c', 'b', 'a']);
    });

    test('is empty for no rows', () {
      expect(
        mergeTransactions(expenses: [], incomes: [], incomeTypeNames: const {}),
        isEmpty,
      );
    });
  });
}
