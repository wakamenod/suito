import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'register_income_repository.g.dart';

class RegisterIncomeRepository {
  RegisterIncomeRepository(this._openapi);
  final Openapi _openapi;

  Future<ModelIncome> registerIncome(RegisterIncomeReq request) async {
    final api = _openapi.getSuitoIncomeApi();
    final response = await api.registerIncome(request: request);
    return response.data?.newIncome ?? ModelIncome();
  }
}

@Riverpod(keepAlive: true)
RegisterIncomeRepository registerIncomeRepository(
    RegisterIncomeRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return RegisterIncomeRepository(openapi);
}
