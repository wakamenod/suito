import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';

part 'delete_income_type_repository.g.dart';

class DeleteIncomeTypeRepository {
  DeleteIncomeTypeRepository(this._client);
  final SupabaseClient _client;

  /// A hard delete: the reference tables carry no `deleted_at`, and the
  /// transactions that pointed here are detached by `on delete set null`
  /// instead of the blank-out UPDATE the Go repository ran.
  Future<void> deleteIncomeType(String id) async {
    await _client.from('income_type').delete().eq('id', id);
  }
}

@Riverpod(keepAlive: true)
DeleteIncomeTypeRepository deleteIncomeTypeRepository(
    DeleteIncomeTypeRepositoryRef ref) {
  return DeleteIncomeTypeRepository(ref.watch(supabaseClientProvider));
}
