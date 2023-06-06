import 'package:flutter_test/flutter_test.dart';

import 'fake_transactions_repository.dart';

void main() {
  FakeTransactionsRepository makeTransactionsRepository() =>
      FakeTransactionsRepository(
        addDelay: false,
      );
  group('FakeTransactionsRepository', () {
    test('getTransactionsList returns global list', () {
      final transactionsRepository = makeTransactionsRepository();
      expect(
        transactionsRepository.getTransactionsList(),
        kFakeTransactions,
      );
    });

    test('getTransaction(AAA) returns first item', () {
      final transactionsRepository = makeTransactionsRepository();
      expect(
        transactionsRepository.getTransaction('AAA'),
        kFakeTransactions[0],
      );
    });

    test('getTransaction(ZZZ) returns null', () {
      final transactionsRepository = makeTransactionsRepository();
      expect(
        transactionsRepository.getTransaction('ZZZ'),
        null,
      );
    });

    test('fetchTransactionsList returns global list', () async {
      final transactionsRepository = makeTransactionsRepository();
      expect(
        await transactionsRepository.fetchTransactionsList('2023-05'),
        kFakeTransactions,
      );
    });

    // test('watchTransactionsList emits global list', () {
    //   final transactionsRepository = makeTransactionsRepository();
    //   expect(
    //     transactionsRepository.watchTransactionsList(),
    //     emits(kTestTransactions),
    //   );
    // });
    // test('watchTransaction(1) emits first item', () {
    //   final transactionsRepository = makeTransactionsRepository();
    //   expect(
    //     transactionsRepository.watchTransaction('1'),
    //     emits(kTestTransactions[0]),
    //   );
    // });
    // test('watchTransaction(100) emits null', () {
    //   final transactionsRepository = makeTransactionsRepository();
    //   expect(
    //     transactionsRepository.watchTransaction('100'),
    //     emits(null),
    //   );
    // });
  });
}
