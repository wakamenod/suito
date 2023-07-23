import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/schedules/repositories/expense/expense_schedule_detail_repository.dart';
import 'package:suito/src/features/schedules/repositories/income/income_schedule_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_categories_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_locations_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/income_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/income_types_repository.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_controller.dart';
import 'package:suito/src/features/transactions/services/income/income_form_controller.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_detail_navigator.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_service.dart';
import 'package:suito/src/routing/app_router.dart';

import '../../../../mocks.dart';

void main() {
  late MockGoRouter mockGoRouter;
  late MockExpenseDetailRepository mockExpenseDetailRepository;
  late MockExpenseScheduleDetailRepository mockExpenseScheduleDetailRepository;
  late MockIncomeDetailRepository mockIncomeDetailRepository;
  late MockIncomeScheduleDetailRepository mockIncomeScheduleDetailRepository;
  late MockExpenseCategoriesRepository mockExpenseCategoriesRepository;
  late MockExpenseLocationsRepository mockExpenseLocationsRepository;
  late MockIncomeTypesRepository mockIncomeTypesRepository;
  setUp(() {
    mockGoRouter = MockGoRouter();
    mockExpenseDetailRepository = MockExpenseDetailRepository();
    mockExpenseScheduleDetailRepository = MockExpenseScheduleDetailRepository();
    mockIncomeDetailRepository = MockIncomeDetailRepository();
    mockIncomeScheduleDetailRepository = MockIncomeScheduleDetailRepository();
    mockExpenseCategoriesRepository = MockExpenseCategoriesRepository();
    mockExpenseLocationsRepository = MockExpenseLocationsRepository();
    mockIncomeTypesRepository = MockIncomeTypesRepository();
  });

  ProviderContainer makeProviderContainer() {
    final container = ProviderContainer(
      overrides: [
        goRouterProvider.overrideWith((ref, arg) => mockGoRouter),
        expenseDetailRepositoryProvider
            .overrideWithValue(mockExpenseDetailRepository),
        expenseCategoriesRepositoryProvider
            .overrideWithValue(mockExpenseCategoriesRepository),
        expenseLocationsRepositoryProvider
            .overrideWithValue(mockExpenseLocationsRepository),
        incomeTypesRepositoryProvider
            .overrideWithValue(mockIncomeTypesRepository),
        incomeDetailRepositoryProvider
            .overrideWithValue(mockIncomeDetailRepository),
        expenseScheduleDetailRepositoryProvider
            .overrideWithValue(mockExpenseScheduleDetailRepository),
        incomeScheduleDetailRepositoryProvider
            .overrideWithValue(mockIncomeScheduleDetailRepository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<int>());
  });

  group('TransactionDetailNavigator', () {
    test('goNewExpense', () async {
      // setup
      final container = makeProviderContainer();
      final navigator =
          container.read(transactionDetailNavigatorProvider.notifier);
      // run
      navigator.goNewExpense();
      // check
      verify(() => mockGoRouter.goNamed(AppRoute.expenseDetail.name)).called(1);
      expect(container.read(expenseFormInitialValueProvider).isValid, false);
    });

    test('goNewExpenseSchedule', () async {
      // setup
      final container = makeProviderContainer();
      final navigator =
          container.read(transactionDetailNavigatorProvider.notifier);
      // run
      navigator.goNewExpenseSchedule();
      // check
      verify(() => mockGoRouter.goNamed(AppRoute.scheduleExpenseDetail.name))
          .called(1);
      expect(container.read(expenseFormInitialValueProvider).isValid, false);
    });

    test('goNewIncome', () async {
      // setup
      final container = makeProviderContainer();
      final navigator =
          container.read(transactionDetailNavigatorProvider.notifier);
      // run
      navigator.goNewIncome();
      // check

      verify(() => mockGoRouter.goNamed(AppRoute.incomeDetail.name)).called(1);
      expect(container.read(incomeFormInitialValueProvider).isValid, false);
    });

    test('goNewIncomeSchedule', () async {
      // setup
      final container = makeProviderContainer();
      final navigator =
          container.read(transactionDetailNavigatorProvider.notifier);
      // run
      navigator.goNewIncomeSchedule();
      // check

      verify(() => mockGoRouter.goNamed(AppRoute.scheduleIncomeDetail.name))
          .called(1);
      expect(container.read(incomeFormInitialValueProvider).isValid, false);
    });

    test('goFetchExpense', () async {
      // setup
      final container = makeProviderContainer();
      final navigator =
          container.read(transactionDetailNavigatorProvider.notifier);
      final tr = Transaction(
        (t) => t
          ..id = 'transaction_id'
          ..title = 'Transaction Title'
          ..localDate = '2023-05-01'
          ..amount = 400
          ..type = TransactionType.expense.value,
      );
      final category = ModelExpenseCategory((e) => e
        ..id = 'expense_category_id'
        ..name = 'Test Category');
      final location = ModelExpenseLocation((e) => e
        ..id = 'expense_location_id'
        ..name = 'Test Location');
      final res =
          ExpenseDetailRes((r) => r.expense.replace(ModelExpense((b) => b
            ..id = tr.id
            ..title = 'registered title'
            ..localDate = '2023-05-03'
            ..memo = 'Some memo'
            ..amount = 400
            ..expenseCategoryID = category.id
            ..expenseLocationID = location.id)));
      when(() => mockExpenseCategoriesRepository.fetchExpenseCategoriesList())
          .thenAnswer((_) => Future.value([category]));
      when(() => mockExpenseLocationsRepository.fetchExpenseLocationsList())
          .thenAnswer((_) => Future.value([location]));
      when(() => mockExpenseDetailRepository.fetchExpenseDetail(tr.id))
          .thenAnswer((_) => Future.value(res));
      // run
      await navigator.goFetch(tr);
      // check
      verify(() => mockExpenseCategoriesRepository.fetchExpenseCategoriesList())
          .called(1);
      verify(() => mockExpenseLocationsRepository.fetchExpenseLocationsList())
          .called(1);
      verify(() => mockExpenseDetailRepository.fetchExpenseDetail(tr.id))
          .called(1);
      verify(() => mockGoRouter.goNamed(AppRoute.expenseDetail.name)).called(1);
      final formValue = container.read(expenseFormInitialValueProvider);
      expect(formValue.isValid, true);
      expect(formValue.id, tr.id);
      expect(formValue.title.value, res.expense.title);
      expect(formValue.amount.value, res.expense.amount);
      expect(formValue.category, category.name);
      expect(formValue.location, location.name);
    });

    test('goFetchIncome', () async {
      // setup
      final container = makeProviderContainer();
      final navigator =
          container.read(transactionDetailNavigatorProvider.notifier);
      final tr = Transaction(
        (t) => t
          ..id = 'transaction_id'
          ..title = 'Transaction Title'
          ..localDate = '2023-05-01'
          ..amount = 400
          ..type = TransactionType.income.value,
      );
      final incomeType = ModelIncomeType((e) => e
        ..id = 'income_type_id'
        ..name = 'Test Income Type');
      final res = IncomeDetailRes((r) => r.income.replace(ModelIncome((b) => b
        ..id = tr.id
        ..localDate = '2023-05-03'
        ..memo = ''
        ..amount = 400
        ..incomeTypeId = incomeType.id)));
      when(() => mockIncomeTypesRepository.fetchIncomeTypesList())
          .thenAnswer((_) => Future.value([incomeType]));
      when(() => mockIncomeDetailRepository.fetchIncomeDetail(tr.id))
          .thenAnswer((_) => Future.value(res));
      // run
      await navigator.goFetch(tr);
      // check
      verify(() => mockIncomeTypesRepository.fetchIncomeTypesList()).called(1);
      verify(() => mockIncomeDetailRepository.fetchIncomeDetail(tr.id))
          .called(1);
      verify(() => mockGoRouter.goNamed(AppRoute.incomeDetail.name)).called(1);
      final formValue = container.read(incomeFormInitialValueProvider);
      expect(formValue.isValid, true);
      expect(formValue.id, tr.id);
      expect(formValue.title.value, incomeType.name);
      expect(formValue.amount.value, res.income.amount);
    });

    test('goFetchExpenseSchedule', () async {
      // setup
      final container = makeProviderContainer();
      final navigator =
          container.read(transactionDetailNavigatorProvider.notifier);
      final category = ModelExpenseCategory((e) => e
        ..id = 'expense_category_id'
        ..name = 'Test Category');
      final location = ModelExpenseLocation((e) => e
        ..id = 'expense_location_id'
        ..name = 'Test Location');
      const scheduleID = 'schedule_id';
      final res = ExpenseScheduleDetailRes(
          (r) => r.expenseSchedule.replace(ModelExpenseSchedule((b) => b
            ..id = scheduleID
            ..title = 'registered title'
            ..timezone = 'Asia/Tokyo'
            ..memo = 'Some memo'
            ..amount = 400
            ..expenseCategoryID = category.id
            ..expenseLocationID = location.id)));
      when(() => mockExpenseCategoriesRepository.fetchExpenseCategoriesList())
          .thenAnswer((_) => Future.value([category]));
      when(() => mockExpenseLocationsRepository.fetchExpenseLocationsList())
          .thenAnswer((_) => Future.value([location]));
      when(() => mockExpenseScheduleDetailRepository.fetchExpenseScheduleDetail(
          scheduleID)).thenAnswer((_) => Future.value(res));
      // run
      await navigator.goFetchExpenseSchedule(scheduleID);
      // check
      verify(() => mockExpenseCategoriesRepository.fetchExpenseCategoriesList())
          .called(1);
      verify(() => mockExpenseLocationsRepository.fetchExpenseLocationsList())
          .called(1);
      verify(() => mockExpenseScheduleDetailRepository
          .fetchExpenseScheduleDetail(scheduleID)).called(1);
      verify(() => mockGoRouter.goNamed(AppRoute.scheduleExpenseDetail.name))
          .called(1);
      final formValue = container.read(expenseFormInitialValueProvider);
      expect(formValue.isValid, true);
      expect(formValue.id, scheduleID);
      expect(formValue.title.value, res.expenseSchedule.title);
      expect(formValue.amount.value, res.expenseSchedule.amount);
      expect(formValue.category, category.name);
      expect(formValue.location, location.name);
    });

    test('goFetchIncomeSchedule', () async {
      // setup
      final container = makeProviderContainer();
      final navigator =
          container.read(transactionDetailNavigatorProvider.notifier);
      final incomeType = ModelIncomeType((e) => e
        ..id = 'income_type_id'
        ..name = 'Test Income Type');
      const scheduleID = 'schedule_id';
      final res = IncomeScheduleDetailRes(
          (r) => r.incomeSchedule.replace(ModelIncomeSchedule((b) => b
            ..id = scheduleID
            ..timezone = 'Asia/Tokyo'
            ..memo = ''
            ..amount = 400
            ..incomeTypeId = incomeType.id)));
      when(() => mockIncomeTypesRepository.fetchIncomeTypesList())
          .thenAnswer((_) => Future.value([incomeType]));
      when(() => mockIncomeScheduleDetailRepository.fetchIncomeScheduleDetail(
          scheduleID)).thenAnswer((_) => Future.value(res));
      // run
      await navigator.goFetchIncomeSchedule(scheduleID);
      // check
      verify(() => mockIncomeTypesRepository.fetchIncomeTypesList()).called(1);
      verify(() => mockIncomeScheduleDetailRepository
          .fetchIncomeScheduleDetail(scheduleID)).called(1);
      verify(() => mockGoRouter.goNamed(AppRoute.scheduleIncomeDetail.name))
          .called(1);
      final formValue = container.read(incomeFormInitialValueProvider);
      expect(formValue.isValid, true);
      expect(formValue.id, scheduleID);
      expect(formValue.title.value, incomeType.name);
      expect(formValue.amount.value, res.incomeSchedule.amount);
    });
  });
}
