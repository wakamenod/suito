import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'update_income_repository.g.dart';

class UpdateIncomeRepository {
  UpdateIncomeRepository(this._openapi);
  final Openapi _openapi;

  Future<ModelIncome> updateIncome(UpdateIncomeReq request) async {
    final api = _openapi.getSuitoIncomeApi();
    final response = await api.updateIncome(request: request);
    return response.data?.updatedIncome ?? ModelIncome();
  }
}

@Riverpod(keepAlive: true)
UpdateIncomeRepository updateIncomeRepository(UpdateIncomeRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return UpdateIncomeRepository(openapi);
}
