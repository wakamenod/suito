import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'delete_income_schedule_repository.g.dart';

class DeleteIncomeScheduleRepository {
  DeleteIncomeScheduleRepository(this._openapi);
  final Openapi _openapi;

  Future<void> deleteIncomeSchedule(String id) async {
    final api = _openapi.getSuitoIncomeScheduleApi();
    await api.deleteIncomeSchedule(
        request: DeleteIncomeScheduleReq((r) => r.incomeScheduleId = id));
    return;
  }
}

@Riverpod(keepAlive: true)
DeleteIncomeScheduleRepository deleteIncomeScheduleRepository(
    DeleteIncomeScheduleRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return DeleteIncomeScheduleRepository(openapi);
}
