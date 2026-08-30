import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';

part 'delete_income_repository.g.dart';

class DeleteIncomeRepository {
  DeleteIncomeRepository(this._client);
  final SupabaseClient _client;

  /// Soft delete, mirroring [DeleteExpenseRepository]: every read filters
  /// `deleted_at is null`, so stamping it hides the row everywhere.
  Future<void> deleteIncome(String id) async {
    await _client
        .from('income')
        .update({'deleted_at': DateTime.now().toUtc().toIso8601String()})
        .eq('id', id)
        .isFilter('deleted_at', null);
  }
}

@Riverpod(keepAlive: true)
DeleteIncomeRepository deleteIncomeRepository(DeleteIncomeRepositoryRef ref) {
  return DeleteIncomeRepository(ref.watch(supabaseClientProvider));
}
