import 'package:suito/src/utils/delay.dart';
import 'package:suito/src/utils/in_memory_store.dart';

import 'transaction_months_repository.dart';

final kFakeTransactionMonths = [
  "2023-05",
  "2023-03",
  "2023-02",
  "2023-01",
];

class FakeTransactionMonthsRepository implements TransactionMonthsRepository {
  FakeTransactionMonthsRepository({this.addDelay = true});
  final bool addDelay;

  final _transactionMonths =
      InMemoryStore<List<String>>(kFakeTransactionMonths);

  List<String> getTransactionMonthsList() {
    return _transactionMonths.value;
  }

  @override
  Future<List<String>> fetchTransactionMonthsList() async {
    await delay(addDelay);
    return Future.value(_transactionMonths.value);
  }
}
