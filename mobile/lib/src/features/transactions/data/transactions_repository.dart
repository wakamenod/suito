import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'transactions_repository.g.dart';

class TransactionsRepository {
  TransactionsRepository(this._openapi);
  final Openapi _openapi;
  final BehaviorSubject<List<Transaction>> _transactions =
      BehaviorSubject.seeded([]);

  Future<List<Transaction>> fetchTransactionsList(String? yearMonth) async {
    // TODO ここにロジックが入ってしまうのであれば、間にサービス層的なものを入れる必要がある
    // そしてfake_repositoryのテストは不要だと思う
    if (yearMonth == null) {
      return Future.value([]);
    }

    final api = _openapi.getSuitoTransactionsApi();
    final response = await api.listTransactions(yearMonth: yearMonth);
    final transactions = response.data?.transactions.toList() ?? [];
    _transactions.add(transactions);
    return transactions;
  }
}

@Riverpod(keepAlive: true)
TransactionsRepository transactionsRepository(TransactionsRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return TransactionsRepository(openapi);
}

// @riverpod
// Future<List<Transaction>> transactionsListFuture(
//     TransactionsListFutureRef ref) {
//   final transactionsRepository = ref.watch(transactionsRepositoryProvider);
//   return transactionsRepository.fetchTransactionsList();
// }

@riverpod
Stream<List<Transaction>> transactionsListWatch(TransactionsListWatchRef ref) {
  final transactionsRepository = ref.watch(transactionsRepositoryProvider);
  return transactionsRepository._transactions;
}
