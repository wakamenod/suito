import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'fake_income_schedule_detail_repository.dart';

part 'income_schedule_detail_repository.g.dart';

class IncomeScheduleDetailRepository {
  IncomeScheduleDetailRepository(this._openapi);
  // ignore: unused_field, TODO
  final Openapi _openapi;

  Future<FakeIncomeScheduleDetailRes> fetchIncomeScheduleDetail(
      String id) async {
    // final api = _openapi.getSuitoIncomeScheduleApi();
    // final response = await api.incomeScheduleDetail(
    //     request: FakeIncomeScheduleDetailReq((r) => r.id = id));
    // return response.data ?? FakeIncomeScheduleDetailRes();
    return FakeIncomeScheduleDetailRes('', '', 0, '');
  }
}

@Riverpod(keepAlive: true)
IncomeScheduleDetailRepository incomeScheduleDetailRepository(
    IncomeScheduleDetailRepositoryRef ref) {
  // final openapi = ref.watch(openApiProvider);
  // return IncomeScheduleDetailRepository(openapi);
  throw UnimplementedError();
}
