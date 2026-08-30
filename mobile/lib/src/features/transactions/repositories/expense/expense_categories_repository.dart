import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:suito/src/models/transaction_attribute.dart';

part 'expense_categories_repository.g.dart';

class ExpenseCategoriesRepository {
  ExpenseCategoriesRepository(this._client);
  final SupabaseClient _client;

  /// Newest first. uuid v7 is time ordered, so `id desc` keeps the ordering the
  /// Go repository got from its xid keys.
  Future<List<ExpenseCategory>> fetchExpenseCategoriesList() async {
    final rows = await _client
        .from('expense_category')
        .select('id, name')
        .order('id', ascending: false);
    return rows.map(ExpenseCategory.fromJson).toList();
  }
}

@Riverpod(keepAlive: true)
ExpenseCategoriesRepository expenseCategoriesRepository(
    ExpenseCategoriesRepositoryRef ref) {
  return ExpenseCategoriesRepository(ref.watch(supabaseClientProvider));
}

@Riverpod(keepAlive: true)
Future<List<ExpenseCategory>> expenseCategoriesListFuture(
    ExpenseCategoriesListFutureRef ref) {
  final expenseCategoriesRepository =
      ref.watch(expenseCategoriesRepositoryProvider);
  return expenseCategoriesRepository.fetchExpenseCategoriesList();
}

@Riverpod(keepAlive: true)
Future<Map<String, ExpenseCategory>> expenseCategoriesMapFuture(
    ExpenseCategoriesMapFutureRef ref) async {
  final expenseCategoriesRepository =
      ref.watch(expenseCategoriesRepositoryProvider);
  final list = await expenseCategoriesRepository.fetchExpenseCategoriesList();
  return {for (var e in list) e.id!: e};
}
