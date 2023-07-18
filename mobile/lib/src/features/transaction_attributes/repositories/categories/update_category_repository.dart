import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'update_category_repository.g.dart';

class UpdateCategoryRepository {
  UpdateCategoryRepository(this._openapi);
  final Openapi _openapi;

  Future<ModelExpenseCategory> updateCategory(
      UpdateExpenseCategoryReq request) async {
    final api = _openapi.getSuitoExpenseCategoryApi();
    final response = await api.updateExpenseCategory(request: request);
    return response.data?.updatedExpenseCategory ?? ModelExpenseCategory();
  }
}

@Riverpod(keepAlive: true)
UpdateCategoryRepository updateCategoryRepository(
    UpdateCategoryRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return UpdateCategoryRepository(openapi);
}
