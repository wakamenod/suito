import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suito/src/features/schedules/repositories/expense/delete_expense_schedule_repository.dart';
import 'package:suito/src/features/schedules/services/expense/delete_expense_schedule_controller.dart';

import '../../../../mocks.dart';

void main() {
  ProviderContainer makeProviderContainer(
      MockDeleteExpenseScheduleRepository repo) {
    final container = ProviderContainer(
      overrides: [
        deleteExpenseScheduleRepositoryProvider.overrideWithValue(repo),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<int>());
  });

  group('deleteExpenseScheduleController', () {
    test('delete expense schedule, success', () async {
      // setup
      const scheduleID = 'test_expense_schedule_id';
      final deleteRepo = MockDeleteExpenseScheduleRepository();
      when(() => deleteRepo.deleteExpenseSchedule(scheduleID)).thenAnswer(
        (_) => Future.value(null),
      );
      final container = makeProviderContainer(deleteRepo);
      final controller =
          container.read(deleteExpenseScheduleControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        deleteExpenseScheduleControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.deleteExpenseSchedule(scheduleID);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => deleteRepo.deleteExpenseSchedule(scheduleID)).called(1);
    });

    test('delete expense schedule, failure', () async {
      // setup
      const scheduleID = 'test_expense_schedule_id';
      final deleteRepo = MockDeleteExpenseScheduleRepository();
      when(() => deleteRepo.deleteExpenseSchedule(scheduleID)).thenThrow(
        (_) => Exception('Connection failed'),
      );
      final container = makeProviderContainer(deleteRepo);
      final controller =
          container.read(deleteExpenseScheduleControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        deleteExpenseScheduleControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.deleteExpenseSchedule(scheduleID);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => deleteRepo.deleteExpenseSchedule(scheduleID)).called(1);
    });
  });
}
