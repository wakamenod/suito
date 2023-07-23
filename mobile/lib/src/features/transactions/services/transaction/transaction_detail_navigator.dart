import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/app.dart';
import 'package:suito/src/features/schedules/repositories/expense/expense_schedule_detail_repository.dart';
import 'package:suito/src/features/schedules/repositories/income/income_schedule_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_categories_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_locations_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/income_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/income_types_repository.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_controller.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_value.dart';
import 'package:suito/src/features/transactions/services/income/income_form_controller.dart';
import 'package:suito/src/features/transactions/services/income/income_form_value.dart';
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/utils/datetime_utils.dart';

import 'transaction_service.dart';

class TransactionDetailNavigator extends StateNotifier<AsyncValue<void>> {
  TransactionDetailNavigator(this._ref) : super(const AsyncData(null));
  final Ref _ref;

  _fetchCategories() => _ref.read(expenseCategoriesMapFutureProvider.future);
  _fetchLocations() => _ref.read(expenseLocationsMapFutureProvider.future);
  _fetchIncomeTypes() => _ref.read(incomeTypeMapFutureProvider.future);

  _goExpense() {
    final a = _ref.read(goRouterProvider(navigatorKey));
    a.goNamed(AppRoute.expenseDetail.name);
  }

  _goExpenseSchedule() => _ref
      .read(goRouterProvider(navigatorKey))
      .goNamed(AppRoute.scheduleExpenseDetail.name);

  _goIncome() => _ref
      .read(goRouterProvider(navigatorKey))
      .goNamed(AppRoute.incomeDetail.name);

  _goIncomeSchedule() => _ref
      .read(goRouterProvider(navigatorKey))
      .goNamed(AppRoute.scheduleIncomeDetail.name);

  _setInitialExpenseValue(ExpenseFormValue value) {
    _ref.read(expenseFormInitialValueProvider.notifier).state = value;
  }

  _setInitialIncomeValue(IncomeFormValue value) {
    _ref.read(incomeFormInitialValueProvider.notifier).state = value;
  }

  void goNewExpense() {
    final now = _ref.read(currentTimeProvider);
    _setInitialExpenseValue(ExpenseFormValue.newExpense(now));
    _goExpense();
  }

  void goNewExpenseSchedule() {
    final now = _ref.read(currentTimeProvider);
    _setInitialExpenseValue(ExpenseFormValue.newExpense(now));
    _goExpenseSchedule();
  }

  void goNewIncome() {
    final now = _ref.read(currentTimeProvider);
    _setInitialIncomeValue(IncomeFormValue.newIncome(now));
    _goIncome();
  }

  void goNewIncomeSchedule() {
    final now = _ref.read(currentTimeProvider);
    _setInitialIncomeValue(IncomeFormValue.newIncome(now));
    _goIncomeSchedule();
  }

  Future<void> _goFetchExpense(String id) async {
    state = const AsyncLoading();
    final value = await AsyncValue.guard(() async {
      final categoriesMap = await _fetchCategories();
      final locationsMap = await _fetchLocations();
      final expense = await _ref
          .read(expenseDetailRepositoryProvider)
          .fetchExpenseDetail(id);
      final exp =
          ExpenseFormValue.fromExpense(expense, categoriesMap, locationsMap);
      _setInitialExpenseValue(exp);
    });

    final success = value.hasError == false;
    if (!mounted) return;

    state = value;
    if (success) _goExpense();
  }

  Future<void> _goFetchIncome(String id) async {
    state = const AsyncLoading();
    final value = await AsyncValue.guard(() async {
      final incomeTypesMap = await _fetchIncomeTypes();
      final income =
          await _ref.read(incomeDetailRepositoryProvider).fetchIncomeDetail(id);
      final inc = IncomeFormValue.fromIncome(income, incomeTypesMap);
      _setInitialIncomeValue(inc);
    });

    final success = value.hasError == false;
    if (!mounted) return;

    state = value;
    if (success) _goIncome();
  }

  Future<void> goFetch(Transaction transaction) async {
    TransactionType.isExpense(transaction.type)
        ? await _goFetchExpense(transaction.id)
        : await _goFetchIncome(transaction.id);
  }

  Future<void> goFetchExpenseSchedule(String id) async {
    state = const AsyncLoading();
    final value = await AsyncValue.guard(() async {
      final categoriesMap = await _fetchCategories();
      final locationsMap = await _fetchLocations();
      final expense = await _ref
          .read(expenseScheduleDetailRepositoryProvider)
          .fetchExpenseScheduleDetail(id);
      final exp =
          ExpenseFormValue.fromSchedule(expense, categoriesMap, locationsMap);
      _setInitialExpenseValue(exp);
    });

    final success = value.hasError == false;
    if (!mounted) return;

    state = value;
    if (success) _goExpenseSchedule();
  }

  Future<void> goFetchIncomeSchedule(String id) async {
    state = const AsyncLoading();
    final value = await AsyncValue.guard(() async {
      final incomeTypesMap = await _fetchIncomeTypes();
      final income = await _ref
          .read(incomeScheduleDetailRepositoryProvider)
          .fetchIncomeScheduleDetail(id);
      final inc = IncomeFormValue.fromSchedule(income, incomeTypesMap);
      _setInitialIncomeValue(inc);
    });

    final success = value.hasError == false;
    if (!mounted) return;

    state = value;
    if (success) _goIncomeSchedule();
  }
}

final transactionDetailNavigatorProvider = StateNotifierProvider.autoDispose<
    TransactionDetailNavigator,
    AsyncValue<void>>((ref) => TransactionDetailNavigator(ref));
