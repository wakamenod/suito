import 'package:suito/src/features/home/domain/transaction.dart';
import 'package:suito/src/features/home/domain/transaction_type.dart';
import 'package:suito/src/utils/delay.dart';
import 'package:suito/src/utils/in_memory_store.dart';

const kFakeTransactions = [
  Transaction(
      id: 'AAA', title: 'テスト支払い', amount: 1900, type: TransactionType.expense),
  Transaction(
      id: 'BBB', title: 'コンビニお菓子', amount: 700, type: TransactionType.expense),
  Transaction(
      id: 'CCC', title: '臨時収入', amount: 20000, type: TransactionType.income),
  Transaction(
      id: 'DDD', title: 'サブスク', amount: 12000, type: TransactionType.expense),
  Transaction(
      id: 'FFF', title: 'スーパー買い物', amount: 1290, type: TransactionType.expense),
];

class FakeTransactionsRepository {
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

  Future<List<Transaction>> fetchTransactionsList() async {
    await delay(addDelay);
    return Future.value(_transactions.value);
  }
}
