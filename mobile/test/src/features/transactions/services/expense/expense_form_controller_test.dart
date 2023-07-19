import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transactions/services/expense/expense.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_controller.dart';

void main() {
  ProviderContainer makeProviderContainer() {
    final container = ProviderContainer(
      overrides: [],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('expenseFormController', () {
    test('register new expense - validation valid', () async {
      final container = makeProviderContainer();
      final exp = Expense.init();
      final controller =
          container.read(expenseFormControllerProvider(exp).notifier);
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
      final state = container.read(expenseFormControllerProvider(exp));
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
      final exp = Expense.init();
      final controller =
          container.read(expenseFormControllerProvider(exp).notifier);
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
      final state = container.read(expenseFormControllerProvider(exp));
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
      final exp = Expense.fromModel(res, categoryMap, locationMap);
      final controller =
          container.read(expenseFormControllerProvider(exp).notifier);
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
      final state = container.read(expenseFormControllerProvider(exp));
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
      final exp = Expense.fromModel(res, categoryMap, locationMap);
      final controller =
          container.read(expenseFormControllerProvider(exp).notifier);
      const memo = 'Memo';
      const date = '2023-05-03';
      // run
      controller.onChangeCategory(null);
      controller.onChangeLocation(null);
      controller.onChangeMemo(memo);
      controller.onChangeDate(date);
      // verify
      final state = container.read(expenseFormControllerProvider(exp));
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
