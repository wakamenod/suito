import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';

part 'transaction_months_repository.g.dart';

class TransactionMonthsRepository {
  TransactionMonthsRepository(this._client);
  final SupabaseClient _client;

  /// The `YYYY-MM` of every month with a transaction, newest first. The
  /// distinct-union across expense and income lives in the `transaction_months`
  /// SQL function.
  Future<List<String>> fetchTransactionMonthsList() async {
    final rows = await _client.rpc<List<dynamic>>('transaction_months');
    return rows.cast<String>();
  }
}

@Riverpod(keepAlive: true)
TransactionMonthsRepository transactionMonthsRepository(
    TransactionMonthsRepositoryRef ref) {
  return TransactionMonthsRepository(ref.watch(supabaseClientProvider));
}
