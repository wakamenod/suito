import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SuitoIncomeScheduleApi
void main() {
  final instance = Openapi().getSuitoIncomeScheduleApi();

  group(SuitoIncomeScheduleApi, () {
    // Get income schedule detail
    //
    // 購入スケジュール詳細情報を取得します.
    //
    //Future<IncomeScheduleDetailRes> incomeScheduleDetail(IncomeScheduleDetailReq request) async
    test('test incomeScheduleDetail', () async {
      // TODO
    });

  });
}
