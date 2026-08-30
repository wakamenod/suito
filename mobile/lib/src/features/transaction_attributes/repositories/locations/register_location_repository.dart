import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_extensions.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/transaction_attribute.dart';

part 'register_location_repository.g.dart';

class RegisterLocationRepository {
  RegisterLocationRepository(this._client);
  final SupabaseClient _client;

  Future<ExpenseLocation> registerLocation(String name) async {
    final row = await _client
        .from('expense_location')
        .insert({'name': name, 'user_id': _client.requireUserId})
        .select('id, name')
        .single();
    return ExpenseLocation.fromJson(row);
  }
}

@Riverpod(keepAlive: true)
RegisterLocationRepository registerLocationRepository(
    RegisterLocationRepositoryRef ref) {
  return RegisterLocationRepository(ref.watch(supabaseClientProvider));
}
