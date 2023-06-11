import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'delete_expense_repository.g.dart';

class DeleteExpenseRepository {
  DeleteExpenseRepository(this._openapi);
  final Openapi _openapi;

  Future<void> deleteExpense(String id) async {
    final api = _openapi.getSuitoExpenseApi();
    await api.deleteExpense(request: DeleteExpenseReq((r) => r.expenseId = id));
    return;
  }
}

@Riverpod(keepAlive: true)
DeleteExpenseRepository deleteExpenseRepository(
    DeleteExpenseRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return DeleteExpenseRepository(openapi);
}
