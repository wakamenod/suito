import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/features/schedules/repositories/fake_schedules_repository.dart';

part 'schedules_repository.g.dart';

class SchedulesRepository {
  SchedulesRepository(this._openapi);
  // ignore: unused_field, TODO
  final Openapi _openapi;

  Future<FakeScheduleResponse> fetchSchedulesList() async {
    // final api = _openapi.getSuitoSchedulesApi();
    // return response.data?.schedules.toList() ?? [];
    return FakeScheduleResponse([], []);
  }
}

@Riverpod(keepAlive: true)
SchedulesRepository schedulesRepository(SchedulesRepositoryRef ref) {
  // final openapi = ref.watch(openApiProvider);
  // return SchedulesRepository(openapi);
  throw UnimplementedError();
}
