import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/transaction_attribute.dart';

part 'income_types_repository.g.dart';

class IncomeTypesRepository {
  IncomeTypesRepository(this._client);
  final SupabaseClient _client;

  /// Newest first; see [ExpenseCategoriesRepository].
  Future<List<IncomeType>> fetchIncomeTypesList() async {
    final rows = await _client
        .from('income_type')
        .select('id, name')
        .order('id', ascending: false);
    return rows.map(IncomeType.fromJson).toList();
  }
}

@Riverpod(keepAlive: true)
IncomeTypesRepository incomeTypesRepository(IncomeTypesRepositoryRef ref) {
  return IncomeTypesRepository(ref.watch(supabaseClientProvider));
}

@Riverpod(keepAlive: true)
Future<List<IncomeType>> incomeTypesListFuture(IncomeTypesListFutureRef ref) {
  final incomeTypesRepository = ref.watch(incomeTypesRepositoryProvider);
  return incomeTypesRepository.fetchIncomeTypesList();
}

@Riverpod(keepAlive: true)
Future<Map<String, IncomeType>> incomeTypeMapFuture(
    IncomeTypeMapFutureRef ref) async {
  final incomeTypesRepository = ref.watch(incomeTypesRepositoryProvider);
  final list = await incomeTypesRepository.fetchIncomeTypesList();
  return {for (var e in list) e.id!: e};
}
