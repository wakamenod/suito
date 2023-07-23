import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_categories_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_locations_repository.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_controller.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_value.dart';

import '../../../../mocks.dart';

void main() {
  late MockExpenseDetailRepository expenseDetailRepository;
  late MockExpenseCategoriesRepository expenseCategoryRepository;
  late MockExpenseLocationsRepository expenseLocationRepository;
  setUp(() {
    expenseDetailRepository = MockExpenseDetailRepository();
    expenseCategoryRepository = MockExpenseCategoriesRepository();
    expenseLocationRepository = MockExpenseLocationsRepository();
  });

  ProviderContainer makeProviderContainer() {
    final container = ProviderContainer(
      overrides: [
        expenseDetailRepositoryProvider
            .overrideWithValue(expenseDetailRepository),
        expenseCategoriesRepositoryProvider
            .overrideWithValue(expenseCategoryRepository),
        expenseLocationsRepositoryProvider
            .overrideWithValue(expenseLocationRepository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('expenseFormController', () {
    test('register new expense - validation valid', () async {
      final container = makeProviderContainer();
      final controller = container.read(expenseFormControllerProvider.notifier);
      const title = 'New title value';
      const amount = 4000;
      const memo = 'Memo';
      const date = '2023-05-03';
      final category = AttributeEntry('category_id', 'category name');
      final location = AttributeEntry('location_id', 'location name');
      // run
      controller.onChangeTitle(title);
      controller.onChangeAmount(amount);
      controller.onChangeCategory(category);
      controller.onChangeLocation(location);
      controller.onChangeMemo(memo);
      controller.onChangeDate(date);
      // verify
      final state = container.read(expenseFormControllerProvider);
      expect(state.title.value, title);
      expect(state.amount.value, amount);
      expect(state.category, category.name);
      expect(state.categoryID, category.id);
      expect(state.location, location.name);
      expect(state.locationID, location.id);
      expect(state.memo, memo);
      expect(state.date, date);
      expect(state.isValid, true);
    });

    test('register new expense - validation invalid', () async {
      final container = makeProviderContainer();
      final controller = container.read(expenseFormControllerProvider.notifier);
      const memo = 'Memo';
      const date = '2023-05-03';
      final category = AttributeEntry('category_id', 'category name');
      final location = AttributeEntry('location_id', 'location name');
      // run
      controller.onChangeCategory(category);
      controller.onChangeLocation(location);
      controller.onChangeMemo(memo);
      controller.onChangeDate(date);
      // verify
      final state = container.read(expenseFormControllerProvider);
      expect(state.category, category.name);
      expect(state.categoryID, category.id);
      expect(state.location, location.name);
      expect(state.locationID, location.id);
      expect(state.memo, memo);
      expect(state.date, date);
      expect(state.isValid, false);
    });

    test('update expense - validation invalid', () async {
      final container = makeProviderContainer();
      final categoryMap = {
        "category_id": ModelExpenseCategory((b) => b.name = 'A category')
      };
      final locationMap = {
        "location_id": ModelExpenseLocation((b) => b.name = 'A location')
      };
      final res =
          ExpenseDetailRes((r) => r.expense.replace(ModelExpense((b) => b
            ..id = 'expense_id'
            ..title = 'registered title'
            ..localDate = '2023-05-03'
            ..memo = ''
            ..amount = 400
            ..expenseCategoryID = 'category_id'
            ..expenseLocationID = 'location_id')));
      final exp = ExpenseFormValue.fromExpense(res, categoryMap, locationMap);
      container.read(expenseFormInitialValueProvider.notifier).state = exp;
      final controller = container.read(expenseFormControllerProvider.notifier);
      const memo = 'Memo';
      const date = '2023-05-03';
      final category = AttributeEntry('category_id', 'category name');
      final location = AttributeEntry('location_id', 'location name');
      // run
      controller.onChangeTitle('');
      controller.onChangeCategory(category);
      controller.onChangeLocation(location);
      controller.onChangeMemo(memo);
      controller.onChangeDate(date);
      // verify
      final state = container.read(expenseFormControllerProvider);
      expect(state.category, category.name);
      expect(state.categoryID, category.id);
      expect(state.location, location.name);
      expect(state.locationID, location.id);
      expect(state.memo, memo);
      expect(state.date, date);
      expect(state.isValid, false);
    });

    test('update expense - validation valid', () async {
      final container = makeProviderContainer();
      final categoryMap = {
        "category_id": ModelExpenseCategory((b) => b.name = 'A category')
      };
      final locationMap = {
        "location_id": ModelExpenseLocation((b) => b.name = 'A location')
      };
      final res =
          ExpenseDetailRes((r) => r.expense.replace(ModelExpense((b) => b
            ..id = 'expense_id'
            ..title = 'registered title'
            ..localDate = '2023-05-03'
            ..memo = ''
            ..amount = 400
            ..expenseCategoryID = 'category_id'
            ..expenseLocationID = 'location_id')));
      final exp = ExpenseFormValue.fromExpense(res, categoryMap, locationMap);
      container.read(expenseFormInitialValueProvider.notifier).state = exp;
      final controller = container.read(expenseFormControllerProvider.notifier);
      const memo = 'Memo';
      const date = '2023-05-03';
      // run
      controller.onChangeCategory(null);
      controller.onChangeLocation(null);
      controller.onChangeMemo(memo);
      controller.onChangeDate(date);
      // verify
      final state = container.read(expenseFormControllerProvider);
      expect(state.category, '');
      expect(state.categoryID, '');
      expect(state.location, '');
      expect(state.locationID, '');
      expect(state.memo, memo);
      expect(state.date, date);
      expect(state.isValid, true);
    });
  });
}
