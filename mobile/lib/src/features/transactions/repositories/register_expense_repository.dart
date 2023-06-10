import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'register_expense_repository.g.dart';

class RegisterExpenseRepository {
  RegisterExpenseRepository(this._openapi);
  final Openapi _openapi;

  Future<ModelExpense> registerExpense(RegisterExpenseReq request) async {
    final api = _openapi.getSuitoExpenseApi();
    final response = await api.registerExpense(request: request);
    return response.data?.newExpense ?? ModelExpense();
  }
}

@Riverpod(keepAlive: true)
RegisterExpenseRepository registerExpenseRepository(
    RegisterExpenseRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return RegisterExpenseRepository(openapi);
}
