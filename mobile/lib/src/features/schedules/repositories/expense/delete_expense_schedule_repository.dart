import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'delete_expense_schedule_repository.g.dart';

class DeleteExpenseScheduleRepository {
  DeleteExpenseScheduleRepository(this._openapi);
  final Openapi _openapi;

  Future<void> deleteExpenseSchedule(String id) async {
    final api = _openapi.getSuitoExpenseScheduleApi();
    await api.deleteExpenseSchedule(
        request: DeleteExpenseScheduleReq((r) => r.expenseScheduleId = id));
    return;
  }
}

@Riverpod(keepAlive: true)
DeleteExpenseScheduleRepository deleteExpenseScheduleRepository(
    DeleteExpenseScheduleRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return DeleteExpenseScheduleRepository(openapi);
}
