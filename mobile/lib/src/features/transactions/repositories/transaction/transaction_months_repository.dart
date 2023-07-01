import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'transaction_months_repository.g.dart';

class TransactionMonthsRepository {
  TransactionMonthsRepository(this._openapi);
  final Openapi _openapi;

  Future<List<String>> fetchTransactionMonthsList() async {
    final api = _openapi.getSuitoTransactionsApi();
    final response = await api.transactionMonths();
    return response.data?.yearMonths.toList() ?? [];
  }
}

@Riverpod(keepAlive: true)
TransactionMonthsRepository transactionMonthsRepository(
    TransactionMonthsRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return TransactionMonthsRepository(openapi);
}

// @riverpod
// Future<List<String>> transactionMonthsListFuture(
//     TransactionMonthsListFutureRef ref) {
//   final transactionMonthsRepository =
//       ref.watch(transactionMonthsRepositoryProvider);
//   return transactionMonthsRepository.fetchTransactionMonthsList();
// }
