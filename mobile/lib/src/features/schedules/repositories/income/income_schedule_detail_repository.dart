import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/income_schedule.dart';

part 'income_schedule_detail_repository.g.dart';

class IncomeScheduleDetailRepository {
  IncomeScheduleDetailRepository(this._client);
  final SupabaseClient _client;

  Future<IncomeSchedule> fetchIncomeScheduleDetail(String id) async {
    final row = await _client
        .from('income_schedule')
        .select()
        .eq('id', id)
        .isFilter('deleted_at', null)
        .single();
    return IncomeSchedule.fromJson(row);
  }
}

@Riverpod(keepAlive: true)
IncomeScheduleDetailRepository incomeScheduleDetailRepository(
    IncomeScheduleDetailRepositoryRef ref) {
  return IncomeScheduleDetailRepository(ref.watch(supabaseClientProvider));
}
