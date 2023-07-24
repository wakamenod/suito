import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openapi/openapi.dart';

import '../../../mocks.dart';
import '../schedules_robot.dart';

void main() {
  group('ScheduleScreen Golden test group', () {
    testGoldens('Empty list', (tester) async {
      await loadAppFonts();
      final r = SchedulesRobot(tester);
      final res = ListTransactionSchedulesRes();
      final repository = MockSchedulesRepository();
      when(() => repository.fetchSchedulesList())
          .thenAnswer((_) => Future.value(res));
      await r.pumpSchedulesScreen(repository: repository);
      await screenMatchesGolden(tester, 'empty_list');
    });

    testGoldens('Non Empty list', (tester) async {
      await loadAppFonts();
      final r = SchedulesRobot(tester);
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
      final repository = MockSchedulesRepository();
      when(() => repository.fetchSchedulesList())
          .thenAnswer((_) => Future.value(res));
      await r.pumpSchedulesScreen(repository: repository);
      await screenMatchesGolden(tester, 'non_empty_list');
    });
  });
}
