import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/transactions/repositories/expense/register_expense_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/update_expense_repository.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_value.dart';
import 'package:suito/src/features/transactions/services/expense/submit_expense_controller.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart';

import '../../../../mocks.dart';

void main() {
  ProviderContainer makeProviderContainer(
      {MockRegisterExpenseRepository? registerRepo,
      MockUpdateExpenseRepository? updateRepo}) {
    final container = ProviderContainer(
      overrides: [
        if (registerRepo != null)
          registerExpenseRepositoryProvider.overrideWithValue(registerRepo),
        if (updateRepo != null)
          updateExpenseRepositoryProvider.overrideWithValue(updateRepo)
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<int>());
  });

  group('submitExpenseController', () {
    test('register new expense, success', () async {
      // setup
      final registerRepo = MockRegisterExpenseRepository();
      const expense = ExpenseFormValue(
          id: '',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          date: '2023-01-05',
          categoryID: 'category_id',
          category: 'A category',
          locationID: 'location_id',
          location: 'A locatin',
          memo: 'memo',
          isValid: true);
      final resExpense = ModelExpense((e) => e
        ..id = 'new_expense_id'
        ..title = expense.title.value
        ..amount = expense.amount.value
        ..localDate = expense.date
        ..expenseCategoryID = expense.categoryID
        ..expenseLocationID = expense.locationID
        ..memo = expense.memo);
      final req =
          RegisterExpenseReq((r) => r.expense.replace(ModelExpense((e) => e
            ..id = expense.id
            ..title = expense.title.value
            ..amount = expense.amount.value
            ..localDate = expense.date
            ..expenseCategoryID = expense.categoryID
            ..expenseLocationID = expense.locationID
            ..memo = expense.memo)));
      registerFallbackValue(req);
      when(() => registerRepo.registerExpense(any())).thenAnswer(
        (_) => Future.value(resExpense),
      );
      final container = makeProviderContainer(registerRepo: registerRepo);
      final controller =
          container.read(submitExpenseControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        submitExpenseControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.submit(expense);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => registerRepo.registerExpense(any())).called(1);
    });

    test('register new expense, failure', () async {
      // setup
      final registerRepo = MockRegisterExpenseRepository();
      const expense = ExpenseFormValue(
          id: '',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          date: '2023-01-05',
          categoryID: 'category_id',
          category: 'A category',
          locationID: 'location_id',
          location: 'A locatin',
          memo: 'memo',
          isValid: true);
      final req =
          RegisterExpenseReq((r) => r.expense.replace(ModelExpense((e) => e
            ..id = expense.id
            ..title = expense.title.value
            ..amount = expense.amount.value
            ..localDate = expense.date
            ..expenseCategoryID = expense.categoryID
            ..expenseLocationID = expense.locationID
            ..memo = expense.memo)));
      registerFallbackValue(req);
      when(() => registerRepo.registerExpense(any())).thenThrow(
        (_) => Exception("Network error"),
      );
      final container = makeProviderContainer(registerRepo: registerRepo);
      final controller =
          container.read(submitExpenseControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        submitExpenseControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.submit(expense);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => registerRepo.registerExpense(any())).called(1);
    });

    test('update expense, success', () async {
      // setup
      final updateRepo = MockUpdateExpenseRepository();
      const expense = ExpenseFormValue(
          id: 'expense_id',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          date: '2023-01-05',
          categoryID: 'category_id',
          category: 'A category',
          locationID: 'location_id',
          location: 'A locatin',
          memo: 'memo',
          isValid: true);
      final resExpense = ModelExpense((e) => e
        ..id = expense.id
        ..title = expense.title.value
        ..amount = expense.amount.value
        ..localDate = expense.date
        ..expenseCategoryID = expense.categoryID
        ..expenseLocationID = expense.locationID
        ..memo = expense.memo);
      final req =
          UpdateExpenseReq((r) => r.expense.replace(ModelExpense((e) => e
            ..id = expense.id
            ..title = expense.title.value
            ..amount = expense.amount.value
            ..localDate = expense.date
            ..expenseCategoryID = expense.categoryID
            ..expenseLocationID = expense.locationID
            ..memo = expense.memo)));
      registerFallbackValue(req);
      when(() => updateRepo.updateExpense(any())).thenAnswer(
        (_) => Future.value(resExpense),
      );
      final container = makeProviderContainer(updateRepo: updateRepo);
      final controller =
          container.read(submitExpenseControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        submitExpenseControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.submit(expense);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => updateRepo.updateExpense(any())).called(1);
    });

    test('update expense, failure', () async {
      // setup
      final updateRepo = MockUpdateExpenseRepository();
      const expense = ExpenseFormValue(
          id: 'expense_id',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          date: '2023-01-05',
          categoryID: 'category_id',
          category: 'A category',
          locationID: 'location_id',
          location: 'A locatin',
          memo: 'memo',
          isValid: true);
      final req =
          UpdateExpenseReq((r) => r.expense.replace(ModelExpense((e) => e
            ..id = expense.id
            ..title = expense.title.value
            ..amount = expense.amount.value
            ..localDate = expense.date
            ..expenseCategoryID = expense.categoryID
            ..expenseLocationID = expense.locationID
            ..memo = expense.memo)));
      registerFallbackValue(req);
      when(() => updateRepo.updateExpense(any())).thenThrow(
        (_) => Exception("Network error"),
      );
      final container = makeProviderContainer(updateRepo: updateRepo);
      final controller =
          container.read(submitExpenseControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        submitExpenseControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.submit(expense);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => updateRepo.updateExpense(any())).called(1);
    });

    test('repository is not called if expense form value is invalid', () async {
      // setup
      final registerRepo = MockRegisterExpenseRepository();
      final updateRepo = MockUpdateExpenseRepository();
      const expense = ExpenseFormValue(
          id: '',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          date: '2023-01-05',
          categoryID: 'category_id',
          category: 'A category',
          locationID: 'location_id',
          location: 'A locatin',
          memo: 'memo',
          isValid: false);
      final container = makeProviderContainer(registerRepo: registerRepo);
      final controller =
          container.read(submitExpenseControllerProvider.notifier);
      // run
      await controller.submit(expense);
      // verify
      verifyNever(() => registerRepo.registerExpense(any()));
      verifyNever(() => updateRepo.updateExpense(any()));
    });
  });
}
