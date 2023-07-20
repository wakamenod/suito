import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/transactions/repositories/transaction/transactions_repository.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_service.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_year_months.dart';

import '../../../../mocks.dart';

void main() {
  ProviderContainer makeProviderContainer(
      MockTransactionsRepository repo, String month) {
    final container = ProviderContainer(
      overrides: [
        transactionsRepositoryProvider.overrideWith((ref) => repo),
        selectedYearMonthProvider.overrideWith((ref) => month),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<int>());
  });

  group('transactionService', () {
    test('transactionTotalAmounts, empty when loading', () async {
      // setup
      final repo = MockTransactionsRepository();
      const month = '2023-05';
      when(() => repo.fetchTransactionsList(month))
          .thenAnswer((_) => Future.value([]));
      final container = makeProviderContainer(repo, month);
      // run
      final total = container.read(transactionsTotalAmountsProvider);
      // check
      expect(total.balance, 0);
      expect(total.income, 0);
      expect(total.expense, 0);
    });

    test('transactionTotalAmounts, fetched transactions are empty', () async {
      // setup
      final repo = MockTransactionsRepository();
      const month = '2023-05';
      when(() => repo.fetchTransactionsList(month))
          .thenAnswer((_) => Future.value([]));
      final container = makeProviderContainer(repo, month);
      // wait for the request to finish
      await container.read(fetchTransactionsProvider.future);
      // run
      final total = container.read(transactionsTotalAmountsProvider);
      // check
      expect(total.balance, 0);
      expect(total.income, 0);
      expect(total.expense, 0);
    });

    test('transactionTotalAmounts, check calculation', () async {
      // setup
      final repo = MockTransactionsRepository();
      const month = '2023-05';
      when(() => repo.fetchTransactionsList(month))
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
      final container = makeProviderContainer(repo, month);
      // wait for the request to finish
      await container.read(fetchTransactionsProvider.future);
      // run
      final total = container.read(transactionsTotalAmountsProvider);
      // check
      expect(total.balance, -2000);
      expect(total.income, 700);
      expect(total.expense, 2700);
    });

    test('transactionTotalAmounts, empty if error', () async {
      // setup
      final repo = MockTransactionsRepository();
      const month = '2023-05';
      when(() => repo.fetchTransactionsList(month))
          .thenThrow(Exception('Network error'));
      final container = makeProviderContainer(repo, month);
      // run
      final total = container.read(transactionsTotalAmountsProvider);
      // check
      expect(total.balance, 0);
      expect(total.income, 0);
      expect(total.expense, 0);
    });
  });
}
