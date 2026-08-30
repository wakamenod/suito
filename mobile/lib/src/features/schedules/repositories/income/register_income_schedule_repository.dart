import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_extensions.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/income_schedule.dart';

part 'register_income_schedule_repository.g.dart';

class RegisterIncomeScheduleRepository {
  RegisterIncomeScheduleRepository(this._client);
  final SupabaseClient _client;

  /// The first occurrence is enqueued by the `enqueue_after_insert` trigger.
  Future<IncomeSchedule> registerIncomeSchedule(IncomeSchedule schedule) async {
    final row = await _client
        .from('income_schedule')
        .insert({
          ...schedule.toColumns(),
          'user_id': _client.requireUserId,
        })
        .select()
        .single();
    return IncomeSchedule.fromJson(row);
  }
}

@Riverpod(keepAlive: true)
RegisterIncomeScheduleRepository registerIncomeScheduleRepository(
    RegisterIncomeScheduleRepositoryRef ref) {
  return RegisterIncomeScheduleRepository(ref.watch(supabaseClientProvider));
}
