// The models replace the generated OpenAPI ones, so their JSON mapping is now
// hand-written: these tests pin the column names PostgREST exchanges and the
// insert/update column maps the repositories send.

import 'package:flutter_test/flutter_test.dart';
import 'package:suito/src/models/expense.dart';
import 'package:suito/src/models/expense_schedule.dart';
import 'package:suito/src/models/income.dart';
import 'package:suito/src/models/income_schedule.dart';
import 'package:suito/src/models/transaction_attribute.dart';

void main() {
  group('Expense', () {
    test('reads a PostgREST row, extra columns and all', () {
      final e = Expense.fromJson(const {
        'id': 'e1',
        'user_id': 'u1',
        'title': 'Rent',
        'amount': 80000,
        'memo': 'monthly',
        'expense_category_id': 'c1',
        'expense_location_id': 'l1',
        'local_date': '2023-05-01',
        'deleted_at': null,
        'created_at': '2023-05-01T00:00:00+00:00',
      });

      expect(e.id, 'e1');
      expect(e.title, 'Rent');
      expect(e.amount, 80000);
      expect(e.memo, 'monthly');
      expect(e.expenseCategoryId, 'c1');
      expect(e.expenseLocationId, 'l1');
      expect(e.localDate, '2023-05-01');
    });

    test('carries a detached category as null', () {
      final e = Expense.fromJson(const {
        'id': 'e1',
        'title': 'Rent',
        'amount': 1,
        'memo': '',
        'expense_category_id': null,
        'expense_location_id': null,
        'local_date': '2023-05-01',
      });

      expect(e.expenseCategoryId, isNull);
      expect(e.expenseLocationId, isNull);
    });

    test('writes snake_case columns and never writes id', () {
      const e = Expense(
        id: 'e1',
        title: 'Rent',
        amount: 80000,
        memo: 'monthly',
        expenseCategoryId: 'c1',
        expenseLocationId: null,
        localDate: '2023-05-01',
      );

      expect(e.toColumns(), {
        'title': 'Rent',
        'amount': 80000,
        'memo': 'monthly',
        'expense_category_id': 'c1',
        'expense_location_id': null,
        'local_date': '2023-05-01',
      });
    });
  });

  group('Income', () {
    test('round trips through its columns', () {
      const i = Income(
        id: 'i1',
        amount: 200000,
        memo: 'bonus',
        incomeTypeId: 't1',
        localDate: '2023-05-25',
      );

      expect(i.toColumns(), {
        'amount': 200000,
        'memo': 'bonus',
        'income_type_id': 't1',
        'local_date': '2023-05-25',
      });
      expect(Income.fromJson({...i.toColumns(), 'id': 'i1'}), i);
    });
  });

  group('ExpenseSchedule', () {
    test('round trips through its columns, timezone included', () {
      const s = ExpenseSchedule(
        id: 's1',
        title: 'Subscription',
        amount: 980,
        memo: '',
        expenseCategoryId: 'c1',
        expenseLocationId: 'l1',
        timezone: 'Asia/Tokyo',
      );

      expect(s.toColumns(), {
        'title': 'Subscription',
        'amount': 980,
        'memo': '',
        'expense_category_id': 'c1',
        'expense_location_id': 'l1',
        'timezone': 'Asia/Tokyo',
      });
      expect(ExpenseSchedule.fromJson({...s.toColumns(), 'id': 's1'}), s);
    });

    test('defaults the timezone to UTC', () {
      expect(const ExpenseSchedule().timezone, 'UTC');
    });
  });

  group('IncomeSchedule', () {
    test('round trips through its columns', () {
      const s = IncomeSchedule(
        id: 's2',
        amount: 200000,
        memo: 'salary',
        incomeTypeId: 't1',
        timezone: 'Asia/Tokyo',
      );

      expect(s.toColumns(), {
        'amount': 200000,
        'memo': 'salary',
        'income_type_id': 't1',
        'timezone': 'Asia/Tokyo',
      });
      expect(IncomeSchedule.fromJson({...s.toColumns(), 'id': 's2'}), s);
    });
  });

  group('reference tables', () {
    test('read id and name', () {
      expect(ExpenseCategory.fromJson(const {'id': 'c1', 'name': 'Food'}),
          const ExpenseCategory(id: 'c1', name: 'Food'));
      expect(ExpenseLocation.fromJson(const {'id': 'l1', 'name': 'Store'}),
          const ExpenseLocation(id: 'l1', name: 'Store'));
      expect(IncomeType.fromJson(const {'id': 't1', 'name': 'Salary'}),
          const IncomeType(id: 't1', name: 'Salary'));
    });

    test('allow a null id for the synthetic "no entry" placeholder', () {
      expect(const ExpenseCategory(name: 'なし').id, isNull);
    });
  });
}
