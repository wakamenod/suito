import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_extensions.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/income.dart';

part 'register_income_repository.g.dart';

class RegisterIncomeRepository {
  RegisterIncomeRepository(this._client);
  final SupabaseClient _client;

  Future<Income> registerIncome(Income income) async {
    final row = await _client
        .from('income')
        .insert({
          ...income.toColumns(),
          'user_id': _client.requireUserId,
        })
        .select()
        .single();
    return Income.fromJson(row);
  }
}

@Riverpod(keepAlive: true)
RegisterIncomeRepository registerIncomeRepository(
    RegisterIncomeRepositoryRef ref) {
  return RegisterIncomeRepository(ref.watch(supabaseClientProvider));
}
