import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/transaction_attribute.dart';

part 'expense_locations_repository.g.dart';

class ExpenseLocationsRepository {
  ExpenseLocationsRepository(this._client);
  final SupabaseClient _client;

  /// Newest first; see [ExpenseCategoriesRepository].
  Future<List<ExpenseLocation>> fetchExpenseLocationsList() async {
    final rows = await _client
        .from('expense_location')
        .select('id, name')
        .order('id', ascending: false);
    return rows.map(ExpenseLocation.fromJson).toList();
  }
}

@Riverpod(keepAlive: true)
ExpenseLocationsRepository expenseLocationsRepository(
    ExpenseLocationsRepositoryRef ref) {
  return ExpenseLocationsRepository(ref.watch(supabaseClientProvider));
}

@Riverpod(keepAlive: true)
Future<List<ExpenseLocation>> expenseLocationsListFuture(
    ExpenseLocationsListFutureRef ref) {
  final expenseLocationsRepository =
      ref.watch(expenseLocationsRepositoryProvider);
  return expenseLocationsRepository.fetchExpenseLocationsList();
}

@Riverpod(keepAlive: true)
Future<Map<String, ExpenseLocation>> expenseLocationsMapFuture(
    ExpenseLocationsMapFutureRef ref) async {
  final expenseLocationsRepository =
      ref.watch(expenseLocationsRepositoryProvider);
  final list = await expenseLocationsRepository.fetchExpenseLocationsList();
  return {for (var e in list) e.id!: e};
}
