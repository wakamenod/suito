import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SuitoExpenseScheduleApi
void main() {
  final instance = Openapi().getSuitoExpenseScheduleApi();

  group(SuitoExpenseScheduleApi, () {
    // Delete expense schedule
    //
    // 支出スケジュール情報を削除します
    //
    //Future<JsonObject> deleteExpenseSchedule(DeleteExpenseScheduleReq request) async
    test('test deleteExpenseSchedule', () async {
      // TODO
    });

    // Get expense schedule detail
    //
    // 支出スケジュール詳細情報を取得します.
    //
    //Future<ExpenseScheduleDetailRes> expenseScheduleDetail(ExpenseScheduleDetailReq request) async
    test('test expenseScheduleDetail', () async {
      // TODO
    });

    // Register expense schedule
    //
    // 支出スケジュール情報を登録します
    //
    //Future<RegisterExpenseScheduleRes> registerExpenseSchedule(RegisterExpenseScheduleReq request) async
    test('test registerExpenseSchedule', () async {
      // TODO
    });

    // Update expense schedule
    //
    // 支出スケジュール情報を更新します
    //
    //Future<UpdateExpenseScheduleRes> updateExpenseSchedule(UpdateExpenseScheduleReq request) async
    test('test updateExpenseSchedule', () async {
      // TODO
    });

  });
}
