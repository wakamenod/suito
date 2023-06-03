import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

/// tests for SuitoTransactionsApi
void main() {
  final instance = Openapi().getSuitoTransactionsApi();

  group(SuitoTransactionsApi, () {
    // List transactions
    //
    // List transactions.
    //
    //Future<TransactionsListTransactionsRes> listTransactions(String yearMonth) async
    test('test listTransactions', () async {
      // TODO
    });
  });
}
