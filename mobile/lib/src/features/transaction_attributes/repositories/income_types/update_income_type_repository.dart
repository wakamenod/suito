import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/transaction_attribute.dart';

part 'update_income_type_repository.g.dart';

class UpdateIncomeTypeRepository {
  UpdateIncomeTypeRepository(this._client);
  final SupabaseClient _client;

  Future<IncomeType> updateIncomeType(String id, String name) async {
    final row = await _client
        .from('income_type')
        .update({'name': name})
        .eq('id', id)
        .select('id, name')
        .single();
    return IncomeType.fromJson(row);
  }
}

@Riverpod(keepAlive: true)
UpdateIncomeTypeRepository updateIncomeTypeRepository(
    UpdateIncomeTypeRepositoryRef ref) {
  return UpdateIncomeTypeRepository(ref.watch(supabaseClientProvider));
}
