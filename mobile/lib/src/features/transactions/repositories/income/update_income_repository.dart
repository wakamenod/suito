import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/income.dart';

part 'update_income_repository.g.dart';

class UpdateIncomeRepository {
  UpdateIncomeRepository(this._client);
  final SupabaseClient _client;

  Future<Income> updateIncome(Income income) async {
    final row = await _client
        .from('income')
        .update(income.toColumns())
        .eq('id', income.id)
        .select()
        .single();
    return Income.fromJson(row);
  }
}

@Riverpod(keepAlive: true)
UpdateIncomeRepository updateIncomeRepository(UpdateIncomeRepositoryRef ref) {
  return UpdateIncomeRepository(ref.watch(supabaseClientProvider));
}
