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
    //Future<ListTransactionsRes> listTransactions(String yearMonth) async
    test('test listTransactions', () async {
      // TODO
    });

    // List transaction months
    //
    // トランザクションが発生した月(YYYY-MM)の一覧を取得します.
    //
    //Future<TransactionMonthsRes> transactionMonths() async
    test('test transactionMonths', () async {
      // TODO
    });

  });
}
