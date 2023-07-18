import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'delete_income_type_repository.g.dart';

class DeleteIncomeTypeRepository {
  DeleteIncomeTypeRepository(this._openapi);
  final Openapi _openapi;

  Future<void> deleteIncomeType(DeleteIncomeTypeReq request) async {
    final api = _openapi.getSuitoIncomeTypeApi();
    await api.deleteIncomeType(request: request);
    return;
  }
}

@Riverpod(keepAlive: true)
DeleteIncomeTypeRepository deleteIncomeTypeRepository(
    DeleteIncomeTypeRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return DeleteIncomeTypeRepository(openapi);
}
