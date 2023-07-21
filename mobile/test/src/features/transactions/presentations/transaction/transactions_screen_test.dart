import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';
import '../../transactions_robot.dart';

void main() {
  group('Golden test group', () {
    testGoldens('Empty list', (tester) async {
      await loadAppFonts();
      final r = TransactionsRobot(tester);
      final repository = MockTransactionsRepository();
      final monthsRepository = MockTransactionMonthsRepository();
      when(() => repository.fetchTransactionsList(any()))
          .thenAnswer((_) => Future.value([]));
      when(() => monthsRepository.fetchTransactionMonthsList())
          .thenAnswer((_) => Future.value([]));
      await r.pumpTransactionsScreen(
          transactionsRepo: repository, monthsRepo: monthsRepository);
      await screenMatchesGolden(tester, 'empty_list');
    },
        // skip because the default month selected in the dropdown differs depending on the test execution time
        skip: true);
  });

  testWidgets('Empty List', (tester) async {
    await loadAppFonts();
    final r = TransactionsRobot(tester);
    final repository = MockTransactionsRepository();
    final monthsRepository = MockTransactionMonthsRepository();
    when(() => repository.fetchTransactionsList(any()))
        .thenAnswer((_) => Future.value([]));
    when(() => monthsRepository.fetchTransactionMonthsList())
        .thenAnswer((_) => Future.value([]));
    await r.pumpTransactionsScreen(
        transactionsRepo: repository, monthsRepo: monthsRepository);
    await tester.pumpAndSettle();
    r.expectEmptyLabelFound();
  });
}
