import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_extensions.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/expense_schedule.dart';

part 'register_expense_schedule_repository.g.dart';

class RegisterExpenseScheduleRepository {
  RegisterExpenseScheduleRepository(this._client);
  final SupabaseClient _client;

  /// The first occurrence is enqueued by the `enqueue_after_insert` trigger --
  /// the Go create path made that call itself.
  Future<ExpenseSchedule> registerExpenseSchedule(
      ExpenseSchedule schedule) async {
    final row = await _client
        .from('expense_schedule')
        .insert({
          ...schedule.toColumns(),
          'user_id': _client.requireUserId,
        })
        .select()
        .single();
    return ExpenseSchedule.fromJson(row);
  }
}

@Riverpod(keepAlive: true)
RegisterExpenseScheduleRepository registerExpenseScheduleRepository(
    RegisterExpenseScheduleRepositoryRef ref) {
  return RegisterExpenseScheduleRepository(ref.watch(supabaseClientProvider));
}
