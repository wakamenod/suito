import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_extensions.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/expense.dart';

part 'register_expense_repository.g.dart';

class RegisterExpenseRepository {
  RegisterExpenseRepository(this._client);
  final SupabaseClient _client;

  Future<Expense> registerExpense(Expense expense) async {
    final row = await _client
        .from('expense')
        .insert({
          ...expense.toColumns(),
          'user_id': _client.requireUserId,
        })
        .select()
        .single();
    return Expense.fromJson(row);
  }
}

@Riverpod(keepAlive: true)
RegisterExpenseRepository registerExpenseRepository(
    RegisterExpenseRepositoryRef ref) {
  return RegisterExpenseRepository(ref.watch(supabaseClientProvider));
}
