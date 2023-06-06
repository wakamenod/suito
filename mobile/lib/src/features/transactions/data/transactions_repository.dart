import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'transactions_repository.g.dart';

class TransactionsRepository {
  TransactionsRepository(this._openapi);
  final Openapi _openapi;

  Future<List<Transaction>> fetchTransactionsList() async {
    final api = _openapi.getSuitoTransactionsApi();
    final response = await api.listTransactions(yearMonth: '2022-05');
    return response.data?.transactions.toList() ?? [];
  }
}

@Riverpod(keepAlive: true)
TransactionsRepository transactionsRepository(TransactionsRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return TransactionsRepository(openapi);
}

@riverpod
Future<List<Transaction>> transactionsListFuture(
    TransactionsListFutureRef ref) {
  final transactionsRepository = ref.watch(transactionsRepositoryProvider);
  return transactionsRepository.fetchTransactionsList();
}
