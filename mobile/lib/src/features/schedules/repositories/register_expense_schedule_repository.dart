import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'register_expense_schedule_repository.g.dart';

class RegisterExpenseScheduleRepository {
  RegisterExpenseScheduleRepository(this._openapi);
  final Openapi _openapi;

  Future<ModelExpenseSchedule> registerExpenseSchedule(
      RegisterExpenseScheduleReq request) async {
    final api = _openapi.getSuitoExpenseScheduleApi();
    final response = await api.registerExpenseSchedule(request: request);
    return response.data?.newExpenseSchedule ?? ModelExpenseSchedule();
  }
}

@Riverpod(keepAlive: true)
RegisterExpenseScheduleRepository registerExpenseScheduleRepository(
    RegisterExpenseScheduleRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return RegisterExpenseScheduleRepository(openapi);
}
