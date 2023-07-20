import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suito/src/features/transactions/repositories/expense/delete_expense_repository.dart';
import 'package:suito/src/features/transactions/services/expense/delete_expense_controller.dart';

import '../../../../mocks.dart';

void main() {
  ProviderContainer makeProviderContainer(MockDeleteExpenseRepository repo) {
    final container = ProviderContainer(
      overrides: [
        deleteExpenseRepositoryProvider.overrideWithValue(repo),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<int>());
  });

  group('deleteExpenseController', () {
    test('delete expense, success', () async {
      // setup
      const expenseID = 'test_expense_id';
      final deleteRepo = MockDeleteExpenseRepository();
      when(() => deleteRepo.deleteExpense(expenseID)).thenAnswer(
        (_) => Future.value(null),
      );
      final container = makeProviderContainer(deleteRepo);
      final controller =
          container.read(deleteExpenseControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        deleteExpenseControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.deleteExpense(expenseID);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => deleteRepo.deleteExpense(expenseID)).called(1);
    });

    test('delete expense, failure', () async {
      // setup
      const expenseID = 'test_expense_id';
      final deleteRepo = MockDeleteExpenseRepository();
      when(() => deleteRepo.deleteExpense(expenseID)).thenThrow(
        (_) => Exception('Connection failed'),
      );
      final container = makeProviderContainer(deleteRepo);
      final controller =
          container.read(deleteExpenseControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        deleteExpenseControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.deleteExpense(expenseID);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => deleteRepo.deleteExpense(expenseID)).called(1);
    });
  });
}
