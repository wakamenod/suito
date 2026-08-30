import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suito/src/features/transactions/repositories/income/delete_income_repository.dart';
import 'package:suito/src/features/transactions/services/income/delete_income_controller.dart';

import '../../../../mocks.dart';

void main() {
  ProviderContainer makeProviderContainer(MockDeleteIncomeRepository repo) {
    final container = ProviderContainer(
      overrides: [
        deleteIncomeRepositoryProvider.overrideWithValue(repo),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<int>());
  });

  group('deleteIncomeController', () {
    test('delete income, success', () async {
      // setup
      const incomeID = 'test_income_id';
      final deleteRepo = MockDeleteIncomeRepository();
      when(() => deleteRepo.deleteIncome(incomeID)).thenAnswer(
        (_) => Future.value(null),
      );
      final container = makeProviderContainer(deleteRepo);
      final controller =
          container.read(deleteIncomeControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        deleteIncomeControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      final deleted = await controller.deleteIncome(incomeID);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
      expect(deleted, isTrue);
      verify(() => deleteRepo.deleteIncome(incomeID)).called(1);
    });

    test('delete income, failure', () async {
      // setup
      const incomeID = 'test_income_id';
      final deleteRepo = MockDeleteIncomeRepository();
      when(() => deleteRepo.deleteIncome(incomeID)).thenThrow(
        (_) => Exception('Connection failed'),
      );
      final container = makeProviderContainer(deleteRepo);
      final controller =
          container.read(deleteIncomeControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        deleteIncomeControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      final deleted = await controller.deleteIncome(incomeID);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
      expect(deleted, isFalse,
          reason: 'the caller restores the row it optimistically hid');
      verify(() => deleteRepo.deleteIncome(incomeID)).called(1);
    });
  });
}
