import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transactions/repositories/transactions_repository.dart';
import 'package:suito/src/features/transactions/services/transaction_year_months.dart';

import 'transactions_total_amounts.dart';

part 'transaction_service.g.dart';

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
  final transactionsAsyncValue = ref.watch(fetchTransactionsProvider);
  return transactionsAsyncValue.when(
      data: (transactions) => _calcTotalAmounts(transactions),
      error: (_, __) => TransactionsTotalAmounts.empty,
      loading: () => TransactionsTotalAmounts.empty);
}

@riverpod
class ReloadTransactions extends _$ReloadTransactions {
  @override
  int build() {
    return 0;
  }

  Future<void> reload() async {
    state++;
  }
}

@riverpod
Future<List<Transaction>> fetchTransactions(FetchTransactionsRef ref) {
  ref.watch(reloadTransactionsProvider);
  final selectedYearMonth = ref.watch(selectedYearMonthProvider);
  final transactionsRepository = ref.read(transactionsRepositoryProvider);
  return transactionsRepository.fetchTransactionsList(selectedYearMonth);
}
