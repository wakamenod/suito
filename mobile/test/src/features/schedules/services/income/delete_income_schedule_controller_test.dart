import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suito/src/features/schedules/repositories/income/delete_income_schedule_repository.dart';
import 'package:suito/src/features/schedules/services/income/delete_income_schedule_controller.dart';

import '../../../../mocks.dart';

void main() {
  ProviderContainer makeProviderContainer(
      MockDeleteIncomeScheduleRepository repo) {
    final container = ProviderContainer(
      overrides: [
        deleteIncomeScheduleRepositoryProvider.overrideWithValue(repo),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<int>());
  });

  group('deleteIncomeScheduleController', () {
    test('delete income schedule, success', () async {
      // setup
      const scheduleID = 'test_income_schedule_id';
      final deleteRepo = MockDeleteIncomeScheduleRepository();
      when(() => deleteRepo.deleteIncomeSchedule(scheduleID)).thenAnswer(
        (_) => Future.value(null),
      );
      final container = makeProviderContainer(deleteRepo);
      final controller =
          container.read(deleteIncomeScheduleControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        deleteIncomeScheduleControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.deleteIncomeSchedule(scheduleID);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => deleteRepo.deleteIncomeSchedule(scheduleID)).called(1);
    });

    test('delete income schedule, failure', () async {
      // setup
      const scheduleID = 'test_income_schedule_id';
      final deleteRepo = MockDeleteIncomeScheduleRepository();
      when(() => deleteRepo.deleteIncomeSchedule(scheduleID)).thenThrow(
        (_) => Exception('Connection failed'),
      );
      final container = makeProviderContainer(deleteRepo);
      final controller =
          container.read(deleteIncomeScheduleControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        deleteIncomeScheduleControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.deleteIncomeSchedule(scheduleID);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => deleteRepo.deleteIncomeSchedule(scheduleID)).called(1);
    });
  });
}
