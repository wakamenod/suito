import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SuitoExpenseScheduleApi
void main() {
  final instance = Openapi().getSuitoExpenseScheduleApi();

  group(SuitoExpenseScheduleApi, () {
    // Get expense schedule detail
    //
    // 支出スケジュール詳細情報を取得します.
    //
    //Future<ExpenseScheduleDetailRes> expenseScheduleDetail(ExpenseScheduleDetailReq request) async
    test('test expenseScheduleDetail', () async {
      // TODO
    });

    // Update expense shcedule
    //
    // 支出スケジュール情報を更新します
    //
    //Future<UpdateExpenseScheduleRes> updateExpenseSchedule(UpdateExpenseScheduleReq request) async
    test('test updateExpenseSchedule', () async {
      // TODO
    });

  });
}
