import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'register_income_schedule_repository.g.dart';

class RegisterIncomeScheduleRepository {
  RegisterIncomeScheduleRepository(this._openapi);
  final Openapi _openapi;

  Future<ModelIncomeSchedule> registerIncomeSchedule(
      RegisterIncomeScheduleReq request) async {
    final api = _openapi.getSuitoIncomeScheduleApi();
    final response = await api.registerIncomeSchedule(request: request);
    return response.data?.newIncomeSchedule ?? ModelIncomeSchedule();
  }
}

@Riverpod(keepAlive: true)
RegisterIncomeScheduleRepository registerIncomeScheduleRepository(
    RegisterIncomeScheduleRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return RegisterIncomeScheduleRepository(openapi);
}
