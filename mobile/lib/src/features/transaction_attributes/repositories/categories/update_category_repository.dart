import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/transaction_attribute.dart';

part 'update_category_repository.g.dart';

class UpdateCategoryRepository {
  UpdateCategoryRepository(this._client);
  final SupabaseClient _client;

  Future<ExpenseCategory> updateCategory(String id, String name) async {
    final row = await _client
        .from('expense_category')
        .update({'name': name})
        .eq('id', id)
        .select('id, name')
        .single();
    return ExpenseCategory.fromJson(row);
  }
}

@Riverpod(keepAlive: true)
UpdateCategoryRepository updateCategoryRepository(
    UpdateCategoryRepositoryRef ref) {
  return UpdateCategoryRepository(ref.watch(supabaseClientProvider));
}
