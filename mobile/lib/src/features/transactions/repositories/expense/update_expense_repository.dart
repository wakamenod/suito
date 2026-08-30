import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/expense.dart';

part 'update_expense_repository.g.dart';

class UpdateExpenseRepository {
  UpdateExpenseRepository(this._client);
  final SupabaseClient _client;

  Future<Expense> updateExpense(Expense expense) async {
    final row = await _client
        .from('expense')
        .update(expense.toColumns())
        .eq('id', expense.id)
        .select()
        .single();
    return Expense.fromJson(row);
  }
}

@Riverpod(keepAlive: true)
UpdateExpenseRepository updateExpenseRepository(
    UpdateExpenseRepositoryRef ref) {
  return UpdateExpenseRepository(ref.watch(supabaseClientProvider));
}
