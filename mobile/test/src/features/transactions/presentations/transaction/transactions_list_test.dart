import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/models/transaction.dart';

import '../../../../mocks.dart';
import '../../transactions_robot.dart';

void main() {
  // The merged list holds expenses and incomes side by side, so the swipe
  // handler has to pick the deleter by `Transaction.type`. Sending an income id
  // to the expense table is a silent no-op -- zero rows updated, no error --
  // which is exactly the bug these tests pin down.
  group('swipe to delete', () {
    const expenseRow = Transaction(
        id: 'expense-1',
        title: 'Groceries',
        localDate: '2023-05-01',
        type: 1,
        amount: 1400);
    const incomeRow = Transaction(
        id: 'income-1',
        title: 'Salary',
        localDate: '2023-05-01',
        type: 2,
        amount: 200000);

    late List<Transaction> rows;
    late MockTransactionsRepository transactionsRepo;
    late MockDeleteExpenseRepository deleteExpenseRepo;
    late MockDeleteIncomeRepository deleteIncomeRepo;

    setUp(() {
      rows = [expenseRow, incomeRow];
      transactionsRepo = MockTransactionsRepository();
      deleteExpenseRepo = MockDeleteExpenseRepository();
      deleteIncomeRepo = MockDeleteIncomeRepository();

      // Mirrors the real flow: the controllers invalidate fetchTransactions
      // after a delete, so the refetch must not return the removed row.
      when(() => transactionsRepo.fetchTransactionsList(any()))
          .thenAnswer((_) => Future.value(List.of(rows)));
      when(() => deleteExpenseRepo.deleteExpense(any()))
          .thenAnswer((inv) async {
        rows.removeWhere((r) => r.id == inv.positionalArguments.first);
      });
      when(() => deleteIncomeRepo.deleteIncome(any())).thenAnswer((inv) async {
        rows.removeWhere((r) => r.id == inv.positionalArguments.first);
      });
    });

    Future<void> pump(TransactionsRobot r) async {
      await r.pumpTransactionsListOnly(
        now: DateTime(2023, 5, 15),
        transactionsRepo: transactionsRepo,
        deleteExpenseRepo: deleteExpenseRepo,
        deleteIncomeRepo: deleteIncomeRepo,
      );
    }

    testWidgets('an expense row goes to the expense repository',
        (tester) async {
      final r = TransactionsRobot(tester);
      await pump(r);

      await r.swipeToDelete('Groceries');

      verify(() => deleteExpenseRepo.deleteExpense('expense-1')).called(1);
      verifyNever(() => deleteIncomeRepo.deleteIncome(any()));
    });

    testWidgets('an income row goes to the income repository', (tester) async {
      final r = TransactionsRobot(tester);
      await pump(r);

      await r.swipeToDelete('Salary');

      verify(() => deleteIncomeRepo.deleteIncome('income-1')).called(1);
      verifyNever(() => deleteExpenseRepo.deleteExpense(any()));
    });

    testWidgets('a deleted row leaves the list and reports success',
        (tester) async {
      final r = TransactionsRobot(tester);
      await pump(r);

      await r.swipeToDelete('Groceries');

      expect(find.text('Groceries'), findsNothing);
      expect(find.text('Salary'), findsOneWidget);
      expect(find.text(t.general.dismissible.snackBar), findsOneWidget);
      expect(find.text(t.general.dismissible.deleteFailed), findsNothing);
    });

    // A failed delete used to skip the invalidate, so the row stayed gone from
    // view while still existing -- and the snackbar claimed success anyway.
    testWidgets('a failed delete puts the row back and says so', (tester) async {
      when(() => deleteExpenseRepo.deleteExpense(any()))
          .thenThrow(Exception('offline'));

      final r = TransactionsRobot(tester);
      await pump(r);

      await r.swipeToDelete('Groceries');

      expect(find.text('Groceries'), findsOneWidget);
      expect(find.text(t.general.dismissible.deleteFailed), findsOneWidget);
      expect(find.text(t.general.dismissible.snackBar), findsNothing);
    });
  });
}
