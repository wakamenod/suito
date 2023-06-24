import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'schedules_repository.g.dart';

class SchedulesRepository {
  SchedulesRepository(this._openapi);
  final Openapi _openapi;

  Future<ListTransactionSchedulesRes> fetchSchedulesList() async {
    final api = _openapi.getSuitoTransactionSchedulesApi();
    final response = await api.listTransactionSchedules();
    return response.data ?? ListTransactionSchedulesRes();
  }
}

@Riverpod(keepAlive: true)
SchedulesRepository schedulesRepository(SchedulesRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return SchedulesRepository(openapi);
}
