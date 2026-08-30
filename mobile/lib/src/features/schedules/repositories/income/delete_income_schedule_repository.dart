import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';

part 'delete_income_schedule_repository.g.dart';

class DeleteIncomeScheduleRepository {
  DeleteIncomeScheduleRepository(this._client);
  final SupabaseClient _client;

  /// Soft delete; see `DeleteExpenseScheduleRepository`.
  Future<void> deleteIncomeSchedule(String id) async {
    await _client
        .from('income_schedule')
        .update({'deleted_at': DateTime.now().toUtc().toIso8601String()})
        .eq('id', id)
        .isFilter('deleted_at', null);
  }
}

@Riverpod(keepAlive: true)
DeleteIncomeScheduleRepository deleteIncomeScheduleRepository(
    DeleteIncomeScheduleRepositoryRef ref) {
  return DeleteIncomeScheduleRepository(ref.watch(supabaseClientProvider));
}
