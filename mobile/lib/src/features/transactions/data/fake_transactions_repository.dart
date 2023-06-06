import 'package:openapi/openapi.dart';
import 'package:suito/src/utils/delay.dart';
import 'package:suito/src/utils/in_memory_store.dart';

import 'transactions_repository.dart';

final kFakeTransactions = [
  Transaction((b) => b
    ..id = 'AAA'
    ..title = 'テスト支払い'
    ..amount = 1900
    ..localDate = '2023-05-01'
    ..type = 1),
  Transaction((b) => b
    ..id = 'BBB'
    ..title = 'コンビニお菓子'
    ..amount = 700
    ..localDate = '2023-05-01'
    ..type = 1),
  Transaction((b) => b
    ..id = 'CCC'
    ..title = '臨時収入'
    ..amount = 20000
    ..localDate = '2023-05-01'
    ..type = 2),
  Transaction((b) => b
    ..id = 'DDD'
    ..title = 'サブスク'
    ..amount = 12000
    ..localDate = '2023-05-01'
    ..type = 1),
  Transaction((b) => b
    ..id = 'FFF'
    ..title = 'スーパー買い物'
    ..amount = 1290
    ..localDate = '2023-05-01'
    ..type = 1),
];

class FakeTransactionsRepository implements TransactionsRepository {
  FakeTransactionsRepository({this.addDelay = true});
  final bool addDelay;

  final _transactions = InMemoryStore<List<Transaction>>(kFakeTransactions);

  List<Transaction> getTransactionsList() {
    return _transactions.value;
  }

  Transaction? getTransaction(String id) {
    return _getTransaction(_transactions.value, id);
  }

  static Transaction? _getTransaction(
      List<Transaction> transactions, String id) {
    try {
      return transactions.firstWhere((transaction) => transaction.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Transaction>> fetchTransactionsList() async {
    await delay(addDelay);
    return Future.value(_transactions.value);
  }
}
