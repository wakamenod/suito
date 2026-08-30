import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/transaction_attribute.dart';

part 'update_location_repository.g.dart';

class UpdateLocationRepository {
  UpdateLocationRepository(this._client);
  final SupabaseClient _client;

  Future<ExpenseLocation> updateLocation(String id, String name) async {
    final row = await _client
        .from('expense_location')
        .update({'name': name})
        .eq('id', id)
        .select('id, name')
        .single();
    return ExpenseLocation.fromJson(row);
  }
}

@Riverpod(keepAlive: true)
UpdateLocationRepository updateLocationRepository(
    UpdateLocationRepositoryRef ref) {
  return UpdateLocationRepository(ref.watch(supabaseClientProvider));
}
