import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'transaction_months_repository.g.dart';

class TransactionMonthsRepository {
  TransactionMonthsRepository(this._openapi);
  // ignore: unused_field, TODO
  final Openapi _openapi;

  Future<List<String>> fetchTransactionMonthsList() async {
    // final api = _openapi.getSuitoTransactionMonthsApi();
    // final response = await api.listTransactionMonths(yearMonth: '2022-05');
    // return response.data?.TransactionMonths.toList() ?? [];
    return Future.value([]);
  }
}

@Riverpod(keepAlive: true)
TransactionMonthsRepository transactionMonthsRepository(
    TransactionMonthsRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return TransactionMonthsRepository(openapi);
}

@riverpod
Future<List<String>> transactionMonthsListFuture(
    TransactionMonthsListFutureRef ref) {
  final transactionMonthsRepository =
      ref.watch(transactionMonthsRepositoryProvider);
  return transactionMonthsRepository.fetchTransactionMonthsList();
}
