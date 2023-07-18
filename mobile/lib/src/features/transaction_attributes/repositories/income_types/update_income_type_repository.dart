import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'update_income_type_repository.g.dart';

class UpdateIncomeTypeRepository {
  UpdateIncomeTypeRepository(this._openapi);
  final Openapi _openapi;

  Future<ModelIncomeType> updateIncomeType(UpdateIncomeTypeReq request) async {
    final api = _openapi.getSuitoIncomeTypeApi();
    final response = await api.updateIncomeType(request: request);
    return response.data?.updatedIncomeType ?? ModelIncomeType();
  }
}

@Riverpod(keepAlive: true)
UpdateIncomeTypeRepository updateIncomeTypeRepository(
    UpdateIncomeTypeRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return UpdateIncomeTypeRepository(openapi);
}
