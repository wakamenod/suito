import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/income_schedule.dart';

part 'update_income_schedule_repository.g.dart';

class UpdateIncomeScheduleRepository {
  UpdateIncomeScheduleRepository(this._client);
  final SupabaseClient _client;

  Future<IncomeSchedule> updateIncomeSchedule(IncomeSchedule schedule) async {
    final row = await _client
        .from('income_schedule')
        .update(schedule.toColumns())
        .eq('id', schedule.id)
        .select()
        .single();
    return IncomeSchedule.fromJson(row);
  }
}

@Riverpod(keepAlive: true)
UpdateIncomeScheduleRepository updateIncomeScheduleRepository(
    UpdateIncomeScheduleRepositoryRef ref) {
  return UpdateIncomeScheduleRepository(ref.watch(supabaseClientProvider));
}
