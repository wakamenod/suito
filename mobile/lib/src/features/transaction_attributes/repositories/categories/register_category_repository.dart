import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_extensions.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/transaction_attribute.dart';

part 'register_category_repository.g.dart';

class RegisterCategoryRepository {
  RegisterCategoryRepository(this._client);
  final SupabaseClient _client;

  Future<ExpenseCategory> registerCategory(String name) async {
    final row = await _client
        .from('expense_category')
        .insert({'name': name, 'user_id': _client.requireUserId})
        .select('id, name')
        .single();
    return ExpenseCategory.fromJson(row);
  }
}

@Riverpod(keepAlive: true)
RegisterCategoryRepository registerCategoryRepository(
    RegisterCategoryRepositoryRef ref) {
  return RegisterCategoryRepository(ref.watch(supabaseClientProvider));
}
