import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';

part 'delete_location_repository.g.dart';

class DeleteLocationRepository {
  DeleteLocationRepository(this._client);
  final SupabaseClient _client;

  /// A hard delete: the reference tables carry no `deleted_at`, and the
  /// transactions that pointed here are detached by `on delete set null`
  /// instead of the blank-out UPDATE the Go repository ran.
  Future<void> deleteLocation(String id) async {
    await _client.from('expense_location').delete().eq('id', id);
  }
}

@Riverpod(keepAlive: true)
DeleteLocationRepository deleteLocationRepository(
    DeleteLocationRepositoryRef ref) {
  return DeleteLocationRepository(ref.watch(supabaseClientProvider));
}
