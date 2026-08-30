import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/expense.dart';

part 'expense_detail_repository.g.dart';

class ExpenseDetailRepository {
  ExpenseDetailRepository(this._client);
  final SupabaseClient _client;

  Future<Expense> fetchExpenseDetail(String id) async {
    final row = await _client
        .from('expense')
        .select()
        .eq('id', id)
        .isFilter('deleted_at', null)
        .single();
    return Expense.fromJson(row);
  }
}

@Riverpod(keepAlive: true)
ExpenseDetailRepository expenseDetailRepository(
    ExpenseDetailRepositoryRef ref) {
  return ExpenseDetailRepository(ref.watch(supabaseClientProvider));
}
