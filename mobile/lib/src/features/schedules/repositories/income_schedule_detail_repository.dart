import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/src/data/openapi_provider.dart';

part 'income_schedule_detail_repository.g.dart';

class IncomeScheduleDetailRepository {
  IncomeScheduleDetailRepository(this._openapi);
  final Openapi _openapi;

  Future<IncomeScheduleDetailRes> fetchIncomeScheduleDetail(String id) async {
    final api = _openapi.getSuitoIncomeScheduleApi();
    final response = await api.incomeScheduleDetail(
        request: IncomeScheduleDetailReq((r) => r.id = id));
    return response.data ?? IncomeScheduleDetailRes();
  }
}

@Riverpod(keepAlive: true)
IncomeScheduleDetailRepository incomeScheduleDetailRepository(
    IncomeScheduleDetailRepositoryRef ref) {
  final openapi = ref.watch(openApiProvider);
  return IncomeScheduleDetailRepository(openapi);
}
