import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/expense_schedule.dart';

part 'update_expense_schedule_repository.g.dart';

class UpdateExpenseScheduleRepository {
  UpdateExpenseScheduleRepository(this._client);
  final SupabaseClient _client;

  Future<ExpenseSchedule> updateExpenseSchedule(
      ExpenseSchedule schedule) async {
    final row = await _client
        .from('expense_schedule')
        .update(schedule.toColumns())
        .eq('id', schedule.id)
        .select()
        .single();
    return ExpenseSchedule.fromJson(row);
  }
}

@Riverpod(keepAlive: true)
UpdateExpenseScheduleRepository updateExpenseScheduleRepository(
    UpdateExpenseScheduleRepositoryRef ref) {
  return UpdateExpenseScheduleRepository(ref.watch(supabaseClientProvider));
}
