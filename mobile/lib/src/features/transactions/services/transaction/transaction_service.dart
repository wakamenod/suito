import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/transactions/repositories/transaction/transactions_repository.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_year_months.dart';

import 'transactions_total_amounts.dart';

part 'transaction_service.g.dart';

enum TransactionType {
  expense(value: 1),
  income(value: 2);

  const TransactionType({required this.value});

  final int value;

  static bool isExpense(val) => val == expense.value;
  static bool isIncome(val) => val == income.value;
  static valueOf(val) => isExpense(val) ? expense : income;
}

TransactionsTotalAmounts _calcTotalAmounts(List<Transaction> list) {
  var expense = 0;
  var income = 0;
  for (var tr in list) {
    if (TransactionType.isExpense(tr.type)) {
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
Future<List<Transaction>> fetchTransactions(FetchTransactionsRef ref) {
  final selectedYearMonth = ref.watch(selectedYearMonthProvider);
  final transactionsRepository = ref.read(transactionsRepositoryProvider);
  return transactionsRepository.fetchTransactionsList(selectedYearMonth);
}
