import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SuitoExpenseScheduleApi
void main() {
  final instance = Openapi().getSuitoExpenseScheduleApi();

  group(SuitoExpenseScheduleApi, () {
    // Get expense schedule detail
    //
    // 購入スケジュール詳細情報を取得します.
    //
    //Future<ExpenseScheduleDetailRes> expenseScheduleDetail(ExpenseScheduleDetailReq request) async
    test('test expenseScheduleDetail', () async {
      // TODO
    });

  });
}
