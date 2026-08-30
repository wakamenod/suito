import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';

part 'delete_expense_schedule_repository.g.dart';

class DeleteExpenseScheduleRepository {
  DeleteExpenseScheduleRepository(this._client);
  final SupabaseClient _client;

  /// Soft delete, as the Go repository did: the schedule stops being listed and
  /// stops being re-enqueued (`enqueue_transaction_schedules` skips
  /// `deleted_at is not null`).
  Future<void> deleteExpenseSchedule(String id) async {
    await _client
        .from('expense_schedule')
        .update({'deleted_at': DateTime.now().toUtc().toIso8601String()})
        .eq('id', id)
        .isFilter('deleted_at', null);
  }
}

@Riverpod(keepAlive: true)
DeleteExpenseScheduleRepository deleteExpenseScheduleRepository(
    DeleteExpenseScheduleRepositoryRef ref) {
  return DeleteExpenseScheduleRepository(ref.watch(supabaseClientProvider));
}
