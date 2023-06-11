import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'update_expense_repository.g.dart';

class UpdateExpenseRepository {
  UpdateExpenseRepository(this._openapi);
  final Openapi _openapi;

  Future<ModelExpense> updateExpense(UpdateExpenseReq request) async {
    final api = _openapi.getSuitoExpenseApi();
    final response = await api.updateExpense(request: request);
    return response.data?.updatedExpense ?? ModelExpense();
  }
}

@Riverpod(keepAlive: true)
UpdateExpenseRepository updateExpenseRepository(
    UpdateExpenseRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return UpdateExpenseRepository(openapi);
}
