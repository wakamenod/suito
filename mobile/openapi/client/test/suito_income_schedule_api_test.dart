import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SuitoIncomeScheduleApi
void main() {
  final instance = Openapi().getSuitoIncomeScheduleApi();

  group(SuitoIncomeScheduleApi, () {
    // Delete income schedule
    //
    // 収入スケジュール情報を削除します
    //
    //Future<JsonObject> deleteIncomeSchedule(DeleteIncomeScheduleReq request) async
    test('test deleteIncomeSchedule', () async {
      // TODO
    });

    // Get income schedule detail
    //
    // 収入スケジュール詳細情報を取得します.
    //
    //Future<IncomeScheduleDetailRes> incomeScheduleDetail(IncomeScheduleDetailReq request) async
    test('test incomeScheduleDetail', () async {
      // TODO
    });

    // Update income schedule
    //
    // 収入スケジュール情報を更新します
    //
    //Future<UpdateIncomeScheduleRes> updateIncomeSchedule(UpdateIncomeScheduleReq request) async
    test('test updateIncomeSchedule', () async {
      // TODO
    });

  });
}
