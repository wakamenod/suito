import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';

part 'delete_expense_repository.g.dart';

class DeleteExpenseRepository {
  DeleteExpenseRepository(this._client);
  final SupabaseClient _client;

  /// Soft delete, as gorm's `Delete` did: every read filters
  /// `deleted_at is null`, so stamping it hides the row everywhere.
  Future<void> deleteExpense(String id) async {
    await _client
        .from('expense')
        .update({'deleted_at': DateTime.now().toUtc().toIso8601String()})
        .eq('id', id)
        .isFilter('deleted_at', null);
  }
}

@Riverpod(keepAlive: true)
DeleteExpenseRepository deleteExpenseRepository(
    DeleteExpenseRepositoryRef ref) {
  return DeleteExpenseRepository(ref.watch(supabaseClientProvider));
}
