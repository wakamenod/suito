// Repository tests against a LOCAL Supabase stack (see supabase_test_stack.dart).
//
// These are what actually prove the Phase 4 queries: the PostgREST filters, the
// column names, the soft-delete convention and the RLS scoping cannot be
// checked by a mock.
@Tags(['supabase'])
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/features/transaction_attributes/repositories/categories/delete_category_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/categories/register_category_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/categories/update_category_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/income_types/register_income_type_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/locations/register_location_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/delete_expense_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_categories_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_locations_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/register_expense_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/update_expense_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/income_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/income_types_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/register_income_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/update_income_repository.dart';
import 'package:suito/src/features/transactions/repositories/transaction/transaction_months_repository.dart';
import 'package:suito/src/features/transactions/repositories/transaction/transactions_repository.dart';
import 'package:suito/src/models/expense.dart';
import 'package:suito/src/models/income.dart';

import 'supabase_test_stack.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(initSupabaseForTests);
  setUp(signUpFreshUser);

  late final registerExpense = RegisterExpenseRepository(supabase);
  late final updateExpense = UpdateExpenseRepository(supabase);
  late final deleteExpense = DeleteExpenseRepository(supabase);
  late final expenseDetail = ExpenseDetailRepository(supabase);
  late final registerIncome = RegisterIncomeRepository(supabase);
  late final updateIncome = UpdateIncomeRepository(supabase);
  late final incomeDetail = IncomeDetailRepository(supabase);
  late final categories = ExpenseCategoriesRepository(supabase);
  late final locations = ExpenseLocationsRepository(supabase);
  late final incomeTypes = IncomeTypesRepository(supabase);
  late final registerCategory = RegisterCategoryRepository(supabase);
  late final updateCategory = UpdateCategoryRepository(supabase);
  late final deleteCategory = DeleteCategoryRepository(supabase);
  late final registerLocation = RegisterLocationRepository(supabase);
  late final registerIncomeType = RegisterIncomeTypeRepository(supabase);
  late final transactions = TransactionsRepository(supabase);
  late final months = TransactionMonthsRepository(supabase);

  group('expense CRUD', () {
    test('registers, reads back, updates and soft deletes', () async {
      final category = await registerCategory.registerCategory(uniqueName('C'));
      final location = await registerLocation.registerLocation(uniqueName('L'));

      final created = await registerExpense.registerExpense(Expense(
        title: 'Groceries',
        amount: 1200,
        memo: 'weekly',
        expenseCategoryId: category.id,
        expenseLocationId: location.id,
        localDate: '2023-05-10',
      ));
      expect(created.id, isNotEmpty);
      expect(created.amount, 1200);

      final fetched = await expenseDetail.fetchExpenseDetail(created.id);
      expect(fetched.title, 'Groceries');
      expect(fetched.memo, 'weekly');
      expect(fetched.expenseCategoryId, category.id);
      expect(fetched.expenseLocationId, location.id);
      expect(fetched.localDate, '2023-05-10');

      final updated = await updateExpense
          .updateExpense(fetched.copyWith(title: 'Groceries II', amount: 999));
      expect(updated.title, 'Groceries II');
      expect(updated.amount, 999);

      await deleteExpense.deleteExpense(created.id);
      await expectLater(
        expenseDetail.fetchExpenseDetail(created.id),
        throwsA(isA<PostgrestException>()),
        reason: 'a soft-deleted row must no longer be readable',
      );
    });

    test('accepts an expense with no category and no location', () async {
      final created = await registerExpense.registerExpense(const Expense(
        title: 'Uncategorized',
        amount: 100,
        localDate: '2023-05-11',
      ));

      final fetched = await expenseDetail.fetchExpenseDetail(created.id);
      expect(fetched.expenseCategoryId, isNull);
      expect(fetched.expenseLocationId, isNull);
    });
  });

  group('income CRUD', () {
    test('registers, reads back and updates', () async {
      final type = await registerIncomeType.registerIncomeType(uniqueName('T'));

      final created = await registerIncome.registerIncome(Income(
        amount: 200000,
        memo: 'salary',
        incomeTypeId: type.id,
        localDate: '2023-05-25',
      ));

      final fetched = await incomeDetail.fetchIncomeDetail(created.id);
      expect(fetched.amount, 200000);
      expect(fetched.incomeTypeId, type.id);

      final updated =
          await updateIncome.updateIncome(fetched.copyWith(amount: 210000));
      expect(updated.amount, 210000);
    });
  });

  group('reference tables', () {
    test('lists newest first', () async {
      final first = await registerCategory.registerCategory(uniqueName('C1'));
      final second = await registerCategory.registerCategory(uniqueName('C2'));

      final list = await categories.fetchExpenseCategoriesList();
      expect(list.map((c) => c.id).toList(), [second.id, first.id]);
    });

    test('renames a category', () async {
      final created = await registerCategory.registerCategory(uniqueName('C'));
      final renamed = uniqueName('Renamed');

      final updated = await updateCategory.updateCategory(created.id!, renamed);

      expect(updated.name, renamed);
      final list = await categories.fetchExpenseCategoriesList();
      expect(list.single.name, renamed);
    });

    test('deleting a category detaches the expenses that referenced it',
        () async {
      final category = await registerCategory.registerCategory(uniqueName('C'));
      final expense = await registerExpense.registerExpense(Expense(
        title: 'Groceries',
        amount: 500,
        expenseCategoryId: category.id,
        localDate: '2023-05-10',
      ));

      await deleteCategory.deleteCategory(category.id!);

      expect(await categories.fetchExpenseCategoriesList(), isEmpty);
      final fetched = await expenseDetail.fetchExpenseDetail(expense.id);
      expect(fetched.expenseCategoryId, isNull,
          reason: '`on delete set null` replaces the Go blank-out update');
    });

    test('locations and income types list independently', () async {
      await registerLocation.registerLocation(uniqueName('L'));
      await registerIncomeType.registerIncomeType(uniqueName('T'));

      expect(await locations.fetchExpenseLocationsList(), hasLength(1));
      expect(await incomeTypes.fetchIncomeTypesList(), hasLength(1));
      expect(await categories.fetchExpenseCategoriesList(), isEmpty);
    });
  });

  group('transaction list', () {
    test('merges the month, newest first, income titled by its type', () async {
      final type = await registerIncomeType.registerIncomeType(uniqueName('T'));

      await registerExpense.registerExpense(const Expense(
          title: 'Early expense', amount: 100, localDate: '2023-05-01'));
      await registerExpense.registerExpense(const Expense(
          title: 'Late expense', amount: 300, localDate: '2023-05-20'));
      await registerIncome.registerIncome(
          Income(amount: 200, incomeTypeId: type.id, localDate: '2023-05-10'));

      final list = await transactions.fetchTransactionsList('2023-05');

      expect(list.map((t) => t.title),
          ['Late expense', type.name, 'Early expense']);
      expect(list.map((t) => t.type), [1, 2, 1]);
    });

    test('covers exactly the requested month', () async {
      await registerExpense.registerExpense(
          const Expense(title: 'April 30', amount: 1, localDate: '2023-04-30'));
      await registerExpense.registerExpense(
          const Expense(title: 'May 1', amount: 1, localDate: '2023-05-01'));
      await registerExpense.registerExpense(
          const Expense(title: 'May 31', amount: 1, localDate: '2023-05-31'));
      await registerExpense.registerExpense(
          const Expense(title: 'June 1', amount: 1, localDate: '2023-06-01'));

      final list = await transactions.fetchTransactionsList('2023-05');

      expect(list.map((t) => t.title).toSet(), {'May 1', 'May 31'});
    });

    test('hides soft-deleted rows', () async {
      final created = await registerExpense.registerExpense(const Expense(
          title: 'Deleted', amount: 100, localDate: '2023-05-10'));

      await deleteExpense.deleteExpense(created.id);

      expect(await transactions.fetchTransactionsList('2023-05'), isEmpty);
    });

    test('is empty for a month with no data', () async {
      expect(await transactions.fetchTransactionsList('1999-01'), isEmpty);
    });
  });

  group('transaction months', () {
    test('lists the distinct months of both sides, newest first', () async {
      final type = await registerIncomeType.registerIncomeType(uniqueName('T'));
      await registerExpense.registerExpense(
          const Expense(title: 'a', amount: 1, localDate: '2023-05-10'));
      await registerExpense.registerExpense(
          const Expense(title: 'b', amount: 1, localDate: '2023-05-11'));
      await registerIncome.registerIncome(
          Income(amount: 1, incomeTypeId: type.id, localDate: '2023-07-01'));

      expect(await months.fetchTransactionMonthsList(), ['2023-07', '2023-05']);
    });

    test('skips soft-deleted rows', () async {
      final created = await registerExpense.registerExpense(
          const Expense(title: 'a', amount: 1, localDate: '2023-05-10'));
      await deleteExpense.deleteExpense(created.id);

      expect(await months.fetchTransactionMonthsList(), isEmpty);
    });
  });

  group('RLS', () {
    test('one user never sees another user\'s rows', () async {
      await registerExpense.registerExpense(const Expense(
          title: 'Private', amount: 100, localDate: '2023-05-10'));
      expect(await transactions.fetchTransactionsList('2023-05'), hasLength(1));

      // A second user, with their own scope.
      await signUpFreshUser();

      expect(await transactions.fetchTransactionsList('2023-05'), isEmpty);
      expect(await months.fetchTransactionMonthsList(), isEmpty);
      expect(await categories.fetchExpenseCategoriesList(), isEmpty);
    });
  });
}
