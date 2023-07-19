import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/schedules/repositories/expense/expense_schedule_detail_repository.dart';
import 'package:suito/src/features/schedules/services/expense/expense_schedule.dart';
import 'package:suito/src/features/schedules/services/expense/expense_schedule_form_controller.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_categories_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_locations_repository.dart';

import '../../../../mocks.dart';

void main() {
  late MockExpenseScheduleDetailRepository expenseScheduleDetailRepository;
  late MockExpenseCategoriesRepository expenseCategoryRepository;
  late MockExpenseLocationsRepository expenseLocationRepository;
  setUp(() {
    expenseScheduleDetailRepository = MockExpenseScheduleDetailRepository();
    expenseCategoryRepository = MockExpenseCategoriesRepository();
    expenseLocationRepository = MockExpenseLocationsRepository();
  });

  ProviderContainer makeProviderContainer() {
    final container = ProviderContainer(
      overrides: [
        expenseScheduleDetailRepositoryProvider
            .overrideWithValue(expenseScheduleDetailRepository),
        expenseCategoriesRepositoryProvider
            .overrideWithValue(expenseCategoryRepository),
        expenseLocationsRepositoryProvider
            .overrideWithValue(expenseLocationRepository),
      ],
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

  group('expenseScheduleFuture', () {
    test('do not fetch expense schedule if id is null', () async {
      // setup
      final container = makeProviderContainer();
      // run
      final schedule =
          await container.read(expenseScheduleFutureProvider().future);
      // check
      expect(schedule.id, '');
    });

    test('do fetch expense schedule if id is not null', () async {
      // setup
      final container = makeProviderContainer();
      final category = ModelExpenseCategory((e) => e
        ..id = 'expense_category_id'
        ..name = 'Test Category');
      final location = ModelExpenseLocation((e) => e
        ..id = 'expense_location_id'
        ..name = 'Test Location');
      final modelSchedule = ModelExpenseSchedule((e) => e
        ..id = 'test_expense_id'
        ..title = 'expense title'
        ..amount = 400
        ..memo = ''
        ..expenseCategoryID = category.id
        ..expenseLocationID = location.id
        ..timezone = 'Asia/Tokyo');
      when(() => expenseScheduleDetailRepository
              .fetchExpenseScheduleDetail(modelSchedule.id))
          .thenAnswer((invocation) => Future.value(ExpenseScheduleDetailRes(
              (b) => b.expenseSchedule.replace(modelSchedule))));
      when(() => expenseCategoryRepository.fetchExpenseCategoriesList())
          .thenAnswer((invocation) => Future.value([category]));
      when(() => expenseLocationRepository.fetchExpenseLocationsList())
          .thenAnswer((invocation) => Future.value([location]));
      // run
      final expenseSchedule = await container
          .read(expenseScheduleFutureProvider(id: modelSchedule.id).future);
      // check
      expect(expenseSchedule.id, modelSchedule.id);
      expect(expenseSchedule.title.value, modelSchedule.title);
      expect(expenseSchedule.amount.value, modelSchedule.amount);
      expect(expenseSchedule.memo, modelSchedule.memo);
      expect(expenseSchedule.category, category.name);
      expect(expenseSchedule.categoryID, category.id);
      expect(expenseSchedule.location, location.name);
      expect(expenseSchedule.locationID, location.id);
    });
  });
}
