import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'transactions_repository.g.dart';

class TransactionsRepository {
  TransactionsRepository(this._openapi);
  final Openapi _openapi;

  Future<List<Transaction>> fetchTransactionsList(String yearMonth) async {
    final api = _openapi.getSuitoTransactionsApi();
    final response = await api.listTransactions(yearMonth: yearMonth);
    return response.data?.transactions.toList() ?? [];
  }
}

@Riverpod(keepAlive: true)
TransactionsRepository transactionsRepository(TransactionsRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return TransactionsRepository(openapi);
}
