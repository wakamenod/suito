import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'register_category_repository.g.dart';

class RegisterCategoryRepository {
  RegisterCategoryRepository(this._openapi);
  final Openapi _openapi;

  Future<ModelExpenseCategory> registerCategory(
      RegisterExpenseCategoryReq request) async {
    final api = _openapi.getSuitoExpenseCategoryApi();
    final response = await api.registerExpenseCategory(request: request);
    return response.data?.newExpenseCategory ?? ModelExpenseCategory();
  }
}

@Riverpod(keepAlive: true)
RegisterCategoryRepository registerCategoryRepository(
    RegisterCategoryRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return RegisterCategoryRepository(openapi);
}
