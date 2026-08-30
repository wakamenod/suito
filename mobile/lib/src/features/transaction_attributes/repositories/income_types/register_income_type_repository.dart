import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_extensions.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/transaction_attribute.dart';

part 'register_income_type_repository.g.dart';

class RegisterIncomeTypeRepository {
  RegisterIncomeTypeRepository(this._client);
  final SupabaseClient _client;

  Future<IncomeType> registerIncomeType(String name) async {
    final row = await _client
        .from('income_type')
        .insert({'name': name, 'user_id': _client.requireUserId})
        .select('id, name')
        .single();
    return IncomeType.fromJson(row);
  }
}

@Riverpod(keepAlive: true)
RegisterIncomeTypeRepository registerIncomeTypeRepository(
    RegisterIncomeTypeRepositoryRef ref) {
  return RegisterIncomeTypeRepository(ref.watch(supabaseClientProvider));
}
