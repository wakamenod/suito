import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/transaction.dart';

part 'schedules_repository.g.dart';

/// Builds the two schedule lists the schedule screen shows.
///
/// Ported from `ListTransactionSchedulesService`: income schedules have no
/// title column, so each borrows its income type's name.
TransactionSchedules buildTransactionSchedules({
  required List<Map<String, dynamic>> expenseRows,
  required List<Map<String, dynamic>> incomeRows,
  required Map<String, String> incomeTypeNames,
}) =>
    TransactionSchedules(
      expenseSchedules: [
        for (final row in expenseRows)
          TransactionSchedule(
            id: row['id'] as String,
            title: row['title'] as String,
            amount: row['amount'] as int,
          ),
      ],
      incomeSchedules: [
        for (final row in incomeRows)
          TransactionSchedule(
            id: row['id'] as String,
            title: incomeTypeNames[row['income_type_id']] ?? '',
            amount: row['amount'] as int,
          ),
      ],
    );

class SchedulesRepository {
  SchedulesRepository(this._client);
  final SupabaseClient _client;

  Future<TransactionSchedules> fetchSchedulesList() async {
    final results = await Future.wait([
      _client
          .from('expense_schedule')
          .select('id, title, amount')
          .isFilter('deleted_at', null)
          .order('id', ascending: true),
      _client
          .from('income_schedule')
          .select('id, amount, income_type_id')
          .isFilter('deleted_at', null)
          .order('id', ascending: true),
      _client.from('income_type').select('id, name'),
    ]);

    return buildTransactionSchedules(
      expenseRows: results[0],
      incomeRows: results[1],
      incomeTypeNames: {
        for (final row in results[2]) row['id'] as String: row['name'] as String
      },
    );
  }
}

@Riverpod(keepAlive: true)
SchedulesRepository schedulesRepository(SchedulesRepositoryRef ref) {
  return SchedulesRepository(ref.watch(supabaseClientProvider));
}
