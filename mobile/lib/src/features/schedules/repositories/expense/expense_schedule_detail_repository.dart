import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/expense_schedule.dart';

part 'expense_schedule_detail_repository.g.dart';

class ExpenseScheduleDetailRepository {
  ExpenseScheduleDetailRepository(this._client);
  final SupabaseClient _client;

  Future<ExpenseSchedule> fetchExpenseScheduleDetail(String id) async {
    final row = await _client
        .from('expense_schedule')
        .select()
        .eq('id', id)
        .isFilter('deleted_at', null)
        .single();
    return ExpenseSchedule.fromJson(row);
  }
}

@Riverpod(keepAlive: true)
ExpenseScheduleDetailRepository expenseScheduleDetailRepository(
    ExpenseScheduleDetailRepositoryRef ref) {
  return ExpenseScheduleDetailRepository(ref.watch(supabaseClientProvider));
}
