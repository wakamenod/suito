import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'expense_detail_repository.g.dart';

class ExpenseDetailRepository {
  ExpenseDetailRepository(this._openapi);
  final Openapi _openapi;

  Future<ExpenseDetailRes> fetchExpenseDetail(String id) async {
    final api = _openapi.getSuitoExpenseApi();
    final response =
        await api.expenseDetail(request: ExpenseDetailReq((r) => r.id = id));
    return response.data ?? ExpenseDetailRes();
  }
}

@Riverpod(keepAlive: true)
ExpenseDetailRepository expenseDetailRepository(
    ExpenseDetailRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return ExpenseDetailRepository(openapi);
}
