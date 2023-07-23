import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/schedules/repositories/schedules_repository.dart';
import 'package:suito/src/features/schedules/services/schedule_service.dart';

import '../../../mocks.dart';

void main() {
  ProviderContainer makeProviderContainer(MockSchedulesRepository repo) {
    final container = ProviderContainer(
      overrides: [
        schedulesRepositoryProvider.overrideWithValue(repo),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<int>());
  });

  group('scheduleService', () {
    test('fetchSchedules, success empty', () async {
      // setup
      final repo = MockSchedulesRepository();
      final res = ListTransactionSchedulesRes();
      when(() => repo.fetchSchedulesList())
          .thenAnswer((_) => Future.value(res));
      final container = makeProviderContainer(repo);
      // run
      final list = await container.read(fetchSchedulesProvider.future);
      // check
      expect(list.length, 2);
      expect(list[0].length, 0);
      expect(list[1].length, 0);
    });

    test('fetchSchedules, success', () async {
      // setup
      final repo = MockSchedulesRepository();
      final res = ListTransactionSchedulesRes((r) => r
        ..incomeSchedules.replace([
          TransactionSchedule((t) => t
            ..id = 'income_schedule_id'
            ..amount = 400
            ..title = 'Income Title')
        ])
        ..expenseSchedules.replace([
          TransactionSchedule((t) => t
            ..id = 'expense_schedule_id'
            ..amount = 400
            ..title = 'Expense Title')
        ]));
      when(() => repo.fetchSchedulesList())
          .thenAnswer((_) => Future.value(res));
      final container = makeProviderContainer(repo);
      // run
      final list = await container.read(fetchSchedulesProvider.future);
      // check
      expect(list.length, 2);
      expect(list[0].length, 1);
      expect(list[1].length, 1);
    });
  });
}
