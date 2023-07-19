import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'update_income_schedule_repository.g.dart';

class UpdateIncomeScheduleRepository {
  UpdateIncomeScheduleRepository(this._openapi);
  final Openapi _openapi;

  Future<ModelIncomeSchedule> updateIncomeSchedule(
      UpdateIncomeScheduleReq request) async {
    final api = _openapi.getSuitoIncomeScheduleApi();
    final response = await api.updateIncomeSchedule(request: request);
    return response.data?.updatedIncomeSchedule ?? ModelIncomeSchedule();
  }
}

@Riverpod(keepAlive: true)
UpdateIncomeScheduleRepository updateIncomeScheduleRepository(
    UpdateIncomeScheduleRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return UpdateIncomeScheduleRepository(openapi);
}
