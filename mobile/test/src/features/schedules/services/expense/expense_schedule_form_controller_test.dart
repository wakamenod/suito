import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/schedules/services/expense/expense_schedule.dart';
import 'package:suito/src/features/schedules/services/expense/expense_schedule_form_controller.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';

void main() {
  ProviderContainer makeProviderContainer() {
    final container = ProviderContainer(
      overrides: [],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('expenseScheduleFormController', () {
    test('register new expense schedule - validation valid', () async {
      final container = makeProviderContainer();
      final exp = ExpenseSchedule.init();
      final controller =
          container.read(expenseScheduleFormControllerProvider(exp).notifier);
      const title = 'New title value';
      const amount = 4000;
      const memo = 'Memo';
      final category = AttributeEntry('category_id', 'category name');
      final location = AttributeEntry('location_id', 'location name');
      // run
      controller.onChangeTitle(title);
      controller.onChangeAmount(amount);
      controller.onChangeCategory(category);
      controller.onChangeLocation(location);
      controller.onChangeMemo(memo);
      // verify
      final state = container.read(expenseScheduleFormControllerProvider(exp));
      expect(state.title.value, title);
      expect(state.amount.value, amount);
      expect(state.category, category.name);
      expect(state.categoryID, category.id);
      expect(state.location, location.name);
      expect(state.locationID, location.id);
      expect(state.memo, memo);
      expect(state.isValid, true);
    });

    test('register new expense schedule - validation invalid', () async {
      final container = makeProviderContainer();
      final exp = ExpenseSchedule.init();
      final controller =
          container.read(expenseScheduleFormControllerProvider(exp).notifier);
      const memo = 'Memo';
      final category = AttributeEntry('category_id', 'category name');
      final location = AttributeEntry('location_id', 'location name');
      // run
      controller.onChangeCategory(category);
      controller.onChangeLocation(location);
      controller.onChangeMemo(memo);
      // verify
      final state = container.read(expenseScheduleFormControllerProvider(exp));
      expect(state.category, category.name);
      expect(state.categoryID, category.id);
      expect(state.location, location.name);
      expect(state.locationID, location.id);
      expect(state.memo, memo);
      expect(state.isValid, false);
    });

    test('update expense schedule - validation invalid', () async {
      final container = makeProviderContainer();
      final categoryMap = {
        "category_id": ModelExpenseCategory((b) => b.name = 'A category')
      };
      final locationMap = {
        "location_id": ModelExpenseLocation((b) => b.name = 'A location')
      };
      final res = ExpenseScheduleDetailRes(
          (r) => r.expenseSchedule.replace(ModelExpenseSchedule((b) => b
            ..id = 'expense_id'
            ..title = 'registered title'
            ..memo = ''
            ..timezone = 'Asia/Tokyo'
            ..amount = 400
            ..expenseCategoryID = 'category_id'
            ..expenseLocationID = 'location_id')));
      final exp = ExpenseSchedule.fromModel(res, categoryMap, locationMap);
      final controller =
          container.read(expenseScheduleFormControllerProvider(exp).notifier);
      const memo = 'Memo';
      final category = AttributeEntry('category_id', 'category name');
      final location = AttributeEntry('location_id', 'location name');
      // run
      controller.onChangeTitle('');
      controller.onChangeCategory(category);
      controller.onChangeLocation(location);
      controller.onChangeMemo(memo);
      // verify
      final state = container.read(expenseScheduleFormControllerProvider(exp));
      expect(state.category, category.name);
      expect(state.categoryID, category.id);
      expect(state.location, location.name);
      expect(state.locationID, location.id);
      expect(state.memo, memo);
      expect(state.isValid, false);
    });

    test('update expense schedule - validation valid', () async {
      final container = makeProviderContainer();
      final categoryMap = {
        "category_id": ModelExpenseCategory((b) => b.name = 'A category')
      };
      final locationMap = {
        "location_id": ModelExpenseLocation((b) => b.name = 'A location')
      };
      final res = ExpenseScheduleDetailRes(
          (r) => r.expenseSchedule.replace(ModelExpenseSchedule((b) => b
            ..id = 'expense_id'
            ..title = 'registered title'
            ..memo = ''
            ..amount = 400
            ..timezone = 'Asia/Tokyo'
            ..expenseCategoryID = 'category_id'
            ..expenseLocationID = 'location_id')));
      final exp = ExpenseSchedule.fromModel(res, categoryMap, locationMap);
      final controller =
          container.read(expenseScheduleFormControllerProvider(exp).notifier);
      const memo = 'Memo';
      // run
      controller.onChangeCategory(null);
      controller.onChangeLocation(null);
      controller.onChangeMemo(memo);
      // verify
      final state = container.read(expenseScheduleFormControllerProvider(exp));
      expect(state.category, '');
      expect(state.categoryID, '');
      expect(state.location, '');
      expect(state.locationID, '');
      expect(state.memo, memo);
      expect(state.isValid, true);
    });
  });
}
