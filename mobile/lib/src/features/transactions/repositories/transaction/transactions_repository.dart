import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/expense.dart';
import 'package:suito/src/models/income.dart';
import 'package:suito/src/models/transaction.dart';
import 'package:suito/src/utils/datetime_utils.dart';

part 'transactions_repository.g.dart';

/// Values of `TransactionType` in `transaction_service.dart`. Duplicated here
/// rather than imported so the repository layer does not depend on services.
const _expenseType = 1;
const _incomeType = 2;

final _yearMonth = RegExp(r'^\d{4}-\d{2}$');

/// The half-open `[start, end)` range covering [yearMonth] (`YYYY-MM`), as the
/// `YYYY-MM-DD` strings PostgREST compares a `date` column against.
///
/// Returns null for anything that is not a year-month -- the selector starts
/// out empty, and no month means "no rows", not an error. The shape is checked
/// up front because `DateTime.tryParse` is lenient enough to read `202305-01`
/// as 2023-05-01.
({String start, String end})? monthRange(String yearMonth) {
  if (!_yearMonth.hasMatch(yearMonth)) return null;
  final start = DateTime.tryParse('$yearMonth-01');
  if (start == null) return null;
  return (
    start: start.toYMD(),
    end: DateTime(start.year, start.month + 1, 1).toYMD(),
  );
}

/// Merges the two transaction sources into the single list the UI shows.
///
/// Ported from `ListTransactionsService` in the Go backend: income rows have no
/// title of their own, so they borrow their income type's name, and the result
/// is newest first with the id as a descending tie-break (uuid v7 is time
/// ordered, so that keeps the previous xid behaviour).
List<Transaction> mergeTransactions({
  required List<Expense> expenses,
  required List<Income> incomes,
  required Map<String, String> incomeTypeNames,
}) {
  final transactions = [
    for (final e in expenses)
      Transaction(
        id: e.id,
        title: e.title,
        amount: e.amount,
        localDate: e.localDate,
        type: _expenseType,
      ),
    for (final i in incomes)
      Transaction(
        id: i.id,
        title: incomeTypeNames[i.incomeTypeId] ?? '',
        amount: i.amount,
        localDate: i.localDate,
        type: _incomeType,
      ),
  ];

  // `YYYY-MM-DD` sorts lexicographically the same way it sorts chronologically.
  transactions.sort((a, b) => a.localDate == b.localDate
      ? b.id.compareTo(a.id)
      : b.localDate.compareTo(a.localDate));
  return transactions;
}

class TransactionsRepository {
  TransactionsRepository(this._client);
  final SupabaseClient _client;

  Future<List<Transaction>> fetchTransactionsList(String yearMonth) async {
    final range = monthRange(yearMonth);
    if (range == null) return [];

    // Three independent reads, each scoped to the caller by RLS.
    final results = await Future.wait([
      _client
          .from('expense')
          .select('id, title, amount, local_date')
          .gte('local_date', range.start)
          .lt('local_date', range.end)
          .isFilter('deleted_at', null),
      _client
          .from('income')
          .select('id, amount, local_date, income_type_id')
          .gte('local_date', range.start)
          .lt('local_date', range.end)
          .isFilter('deleted_at', null),
      _client.from('income_type').select('id, name'),
    ]);

    return mergeTransactions(
      expenses: results[0].map(Expense.fromJson).toList(),
      incomes: results[1].map(Income.fromJson).toList(),
      incomeTypeNames: {
        for (final row in results[2]) row['id'] as String: row['name'] as String
      },
    );
  }
}

@Riverpod(keepAlive: true)
TransactionsRepository transactionsRepository(TransactionsRepositoryRef ref) {
  return TransactionsRepository(ref.watch(supabaseClientProvider));
}
