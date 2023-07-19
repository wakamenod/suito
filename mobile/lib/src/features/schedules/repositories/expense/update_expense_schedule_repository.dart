import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'update_expense_schedule_repository.g.dart';

class UpdateExpenseScheduleRepository {
  UpdateExpenseScheduleRepository(this._openapi);
  final Openapi _openapi;

  Future<ModelExpenseSchedule> updateExpenseSchedule(
      UpdateExpenseScheduleReq request) async {
    final api = _openapi.getSuitoExpenseScheduleApi();
    final response = await api.updateExpenseSchedule(request: request);
    return response.data?.updatedExpenseSchedule ?? ModelExpenseSchedule();
  }
}

@Riverpod(keepAlive: true)
UpdateExpenseScheduleRepository updateExpenseScheduleRepository(
    UpdateExpenseScheduleRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return UpdateExpenseScheduleRepository(openapi);
}
