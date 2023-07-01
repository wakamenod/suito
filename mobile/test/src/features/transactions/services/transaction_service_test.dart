// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
// import 'package:suito/src/features/transactions/repositories/fake_transactions_repository.dart';
import 'package:suito/src/features/transactions/repositories/transaction/transactions_repository.dart';
// import 'package:suito/src/features/transactions/services/transaction_service.dart';
import 'package:suito/src/features/transactions/services/transaction/transactions_total_amounts.dart';

class MockTransactionsRepository extends Mock
    implements TransactionsRepository {}

class Listener extends Mock {
  void call(TransactionsTotalAmounts? previous, TransactionsTotalAmounts value);
}

void main() {
  setUpAll(() {
    // registerFallbackValue(const Cart());
  });

  // TODO fix text
  // late MockTransactionsRepository transactionsRepository;
  // setUp(() {
  //   transactionsRepository = MockTransactionsRepository();
  // });
  // ProviderContainer makeProviderContainer(
  //     {TransactionsRepository? mockRepository,
  //     Transactions? mockTransactions}) {
  //   final container = ProviderContainer(
  //     overrides: [
  //       if (mockTransactions != null)
  //         transactionsProvider.overrideWith(() => mockTransactions),
  //       if (mockRepository != null)
  //         transactionsRepositoryProvider.overrideWithValue(mockRepository),
  //     ],
  //   );
  //   addTearDown(container.dispose);
  //   return container;
  // }

  // group('fetchTransactions', () {
  //   test('fetchTransactions should not be called when yearMonth is null',
  //       () async {
  //     // setup
  //     final mockRepository = MockTransactionsRepository();
  //     final container = makeProviderContainer(mockRepository: mockRepository);
  //     final transactions = container.read(transactionsProvider.notifier);
  //     // run
  //     transactions.fetchTransactions(null);
  //     // verify
  //     verifyNever(
  //       () => mockRepository.fetchTransactionsList(any()),
  //     );
  //   });
  //   test('fetchTransactions should be called with valid yearMonth', () async {
  //     // setup
  //     final mockRepository = MockTransactionsRepository();
  //     final container = makeProviderContainer(mockRepository: mockRepository);
  //     final transactions = container.read(transactionsProvider.notifier);
  //     const yearMonth = '2023-05';
  //     when(() => mockRepository.fetchTransactionsList(yearMonth))
  //         .thenAnswer((_) => Future.value([]));
  //     // run
  //     transactions.fetchTransactions(yearMonth);
  //     // verify
  //     verify(
  //       () => mockRepository.fetchTransactionsList(yearMonth),
  //     );
  //   });
  // });

  // group('transactionsTotalAmounts', () {
  //   test(
  //       'transactionsTotalAmounts should be equal to FakeRepositories transactions totals',
  //       () async {
  //     // setup
  //     final container = makeProviderContainer(
  //         mockRepository: FakeTransactionsRepository(addDelay: false));
  //     final transactions = container.read(transactionsProvider.notifier);
  //     final listener = Listener();
  //     // run
  //     await transactions.fetchTransactions('2023-05');
  //     container.listen<TransactionsTotalAmounts>(
  //       transactionsTotalAmountsProvider,
  //       listener.call,
  //       fireImmediately: true,
  //     );
  //     // check
  //     const expenseTotal = 1900 + 700 + 12000 + 1290;
  //     const incomeTotal = 20000;
  //     verify(() => listener(
  //         null,
  //         const TransactionsTotalAmounts(
  //             balance: incomeTotal - expenseTotal,
  //             expense: expenseTotal,
  //             income: incomeTotal))).called(1);
  //     verifyNoMoreInteractions(listener);
  //   });
  // });

  group('Dummy', () {
    test('dummy', () {});
  });
}
