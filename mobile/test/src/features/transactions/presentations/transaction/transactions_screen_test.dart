import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_service.dart';

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
      final now = DateTime(2023, 7, 1);
      await r.pumpTransactionsScreen(
          now: now, transactionsRepo: repository, monthsRepo: monthsRepository);
      await screenMatchesGolden(tester, 'empty_list');
    });

    testGoldens('Select months dropdown, then check list contents',
        (tester) async {
      await loadAppFonts();
      final r = TransactionsRobot(tester);
      final repository = MockTransactionsRepository();
      final monthsRepository = MockTransactionMonthsRepository();
      when(() => monthsRepository.fetchTransactionMonthsList())
          .thenAnswer((_) => Future.value(['2023-04', '2023-05']));
      when(() => repository.fetchTransactionsList('2023-05'))
          .thenAnswer((_) => Future.value([
                Transaction((t) => t
                  ..id = 'transaction1'
                  ..title = 'Title 1'
                  ..localDate = '2023-05-01'
                  ..type = TransactionType.income.value
                  ..amount = 400),
                Transaction((t) => t
                  ..id = 'transaction2'
                  ..title = 'Title 2'
                  ..localDate = '2023-05-01'
                  ..type = TransactionType.income.value
                  ..amount = 300),
                Transaction((t) => t
                  ..id = 'transaction3'
                  ..title = 'Title 3'
                  ..localDate = '2023-05-01'
                  ..type = TransactionType.expense.value
                  ..amount = 1400),
                Transaction((t) => t
                  ..id = 'transaction4'
                  ..title = 'Title 4'
                  ..localDate = '2023-05-01'
                  ..type = TransactionType.expense.value
                  ..amount = 1300)
              ]));
      final now = DateTime(2023, 7, 1);
      await r.pumpTransactionsScreen(
          now: now, transactionsRepo: repository, monthsRepo: monthsRepository);

      await r.tapToggleButton();
      r.expectDropdownMenuItemFound('2023-04');
      r.tapDropdownMenuItem('2023-05');
      await screenMatchesGolden(tester, 'select_month_dropdown');
    });
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
    final now = DateTime(2023, 7, 1);
    await r.pumpTransactionsScreen(
        now: now, transactionsRepo: repository, monthsRepo: monthsRepository);
    r.expectEmptyLabelFound();
  });
}
