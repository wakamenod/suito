import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'delete_category_repository.g.dart';

class DeleteCategoryRepository {
  DeleteCategoryRepository(this._openapi);
  final Openapi _openapi;

  Future<void> deleteCategory(DeleteExpenseCategoryReq request) async {
    final api = _openapi.getSuitoExpenseCategoryApi();
    await api.deleteExpenseCategory(request: request);
    return;
  }
}

@Riverpod(keepAlive: true)
DeleteCategoryRepository deleteCategoryRepository(
    DeleteCategoryRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return DeleteCategoryRepository(openapi);
}
