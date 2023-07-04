import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'register_income_type_repository.g.dart';

class RegisterIncomeTypeRepository {
  RegisterIncomeTypeRepository(this._openapi);
  final Openapi _openapi;

  Future<ModelIncomeType> registerIncomeType(
      RegisterIncomeTypeReq request) async {
    final api = _openapi.getSuitoIncomeTypeApi();
    final response = await api.registerIncomeType(request: request);
    return response.data?.newIncomeType ?? ModelIncomeType();
  }
}

@Riverpod(keepAlive: true)
RegisterIncomeTypeRepository registerIncomeTypeRepository(
    RegisterIncomeTypeRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return RegisterIncomeTypeRepository(openapi);
}
