import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'expense_schedule_detail_repository.g.dart';

class ExpenseScheduleDetailRepository {
  ExpenseScheduleDetailRepository(this._openapi);
  final Openapi _openapi;

  Future<ExpenseScheduleDetailRes> fetchExpenseScheduleDetail(String id) async {
    final api = _openapi.getSuitoExpenseScheduleApi();
    final response = await api.expenseScheduleDetail(
        request: ExpenseScheduleDetailReq((r) => r.id = id));
    return response.data ?? ExpenseScheduleDetailRes();
  }
}

@Riverpod(keepAlive: true)
ExpenseScheduleDetailRepository expenseScheduleDetailRepository(
    ExpenseScheduleDetailRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return ExpenseScheduleDetailRepository(openapi);
}
