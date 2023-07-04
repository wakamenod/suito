import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'expense_categories_repository.g.dart';

class ExpenseCategoriesRepository {
  ExpenseCategoriesRepository(this._openapi);
  final Openapi _openapi;

  Future<List<ModelExpenseCategory>> fetchExpenseCategoriesList() async {
    final api = _openapi.getSuitoExpenseCategoryApi();
    final response = await api.listExpenseCategories();
    return response.data?.expenseCategories.toList() ?? [];
  }
}

@Riverpod(keepAlive: true)
ExpenseCategoriesRepository expenseCategoriesRepository(
    ExpenseCategoriesRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return ExpenseCategoriesRepository(openapi);
}

@Riverpod(keepAlive: true)
Future<List<ModelExpenseCategory>> expenseCategoriesListFuture(
    ExpenseCategoriesListFutureRef ref) {
  final expenseCategoriesRepository =
      ref.watch(expenseCategoriesRepositoryProvider);
  return expenseCategoriesRepository.fetchExpenseCategoriesList();
}
