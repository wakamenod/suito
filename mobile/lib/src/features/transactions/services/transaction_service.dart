import 'package:openapi/openapi.dart';
import 'package:suito/src/features/transactions/repositories/transactions_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'transactions_total_amounts.dart';

part 'transaction_service.g.dart';

@riverpod
class Transactions extends _$Transactions {
  @override
  FutureOr<List<Transaction>> build() {
    return [];
  }

  Future<List<Transaction>> _fetchTransactions(String yearMonth) async {
    final transactionsRepository = ref.watch(transactionsRepositoryProvider);
    return transactionsRepository.fetchTransactionsList(yearMonth);
  }

  Future<void> fetchTransactions(String? yearMonth) async {
    if (yearMonth == null) return;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return _fetchTransactions(yearMonth);
    });
  }
}

TransactionsTotalAmounts _calcTotalAmounts(List<Transaction> list) {
  var expense = 0;
  var income = 0;
  for (var tr in list) {
    if (tr.type == 1) {
      expense += tr.amount;
    } else {
      income += tr.amount;
    }
  }
  return TransactionsTotalAmounts(
      balance: income - expense, expense: expense, income: income);
}

@riverpod
TransactionsTotalAmounts transactionsTotalAmounts(
    TransactionsTotalAmountsRef ref) {
  final transactionsAsyncValue = ref.watch(transactionsProvider);
  return transactionsAsyncValue.when(
      data: (transactions) => _calcTotalAmounts(transactions),
      error: (_, __) => TransactionsTotalAmounts.empty,
      loading: () => TransactionsTotalAmounts.empty);
}
