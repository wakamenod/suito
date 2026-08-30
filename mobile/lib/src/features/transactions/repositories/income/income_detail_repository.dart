import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/income.dart';

part 'income_detail_repository.g.dart';

class IncomeDetailRepository {
  IncomeDetailRepository(this._client);
  final SupabaseClient _client;

  Future<Income> fetchIncomeDetail(String id) async {
    final row = await _client
        .from('income')
        .select()
        .eq('id', id)
        .isFilter('deleted_at', null)
        .single();
    return Income.fromJson(row);
  }
}

@Riverpod(keepAlive: true)
IncomeDetailRepository incomeDetailRepository(IncomeDetailRepositoryRef ref) {
  return IncomeDetailRepository(ref.watch(supabaseClientProvider));
}
