import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suito/src/models/expense.dart';
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
      final resExpense = Expense(
        id: 'new_expense_id',
        title: expense.title.value,
        amount: expense.amount.value,
        localDate: expense.date,
        expenseCategoryId: expense.categoryID,
        expenseLocationId: expense.locationID,
        memo: expense.memo,
      );
      registerFallbackValue(const Expense());
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
      registerFallbackValue(const Expense());
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
      final resExpense = Expense(
        id: 'new_expense_id',
        title: expense.title.value,
        amount: expense.amount.value,
        localDate: expense.date,
        expenseCategoryId: expense.categoryID,
        expenseLocationId: expense.locationID,
        memo: expense.memo,
      );
      registerFallbackValue(const Expense());
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
      registerFallbackValue(const Expense());
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

  group('submitExpenseController mapping', () {
    // The Postgres columns differ from the form: `local_date` is a DATE, and
    // the uuid FKs are nullable where the form uses an empty string.
    Future<Expense> captureRegistered(ExpenseFormValue form) async {
      final registerRepo = MockRegisterExpenseRepository();
      registerFallbackValue(const Expense());
      when(() => registerRepo.registerExpense(any()))
          .thenAnswer((_) async => const Expense(id: 'new_id'));
      final container = makeProviderContainer(registerRepo: registerRepo);
      await container
          .read(submitExpenseControllerProvider.notifier)
          .submit(form);
      return verify(() => registerRepo.registerExpense(captureAny()))
          .captured
          .single as Expense;
    }

    test('truncates the picker timestamp to a date', () async {
      final sent = await captureRegistered(const ExpenseFormValue(
          id: '',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          date: '2023-01-05 13:45:00.000',
          categoryID: 'category_id',
          category: 'A category',
          locationID: 'location_id',
          location: 'A location',
          memo: 'memo',
          isValid: true));

      expect(sent.localDate, '2023-01-05');
    });

    test('sends no category / no location as null, not an empty uuid',
        () async {
      final sent = await captureRegistered(const ExpenseFormValue(
          id: '',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          date: '2023-01-05',
          categoryID: '',
          category: '',
          locationID: '',
          location: '',
          memo: '',
          isValid: true));

      expect(sent.expenseCategoryId, isNull);
      expect(sent.expenseLocationId, isNull);
    });
  });
}
