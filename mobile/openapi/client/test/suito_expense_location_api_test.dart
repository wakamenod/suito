import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SuitoExpenseLocationApi
void main() {
  final instance = Openapi().getSuitoExpenseLocationApi();

  group(SuitoExpenseLocationApi, () {
    // Delete expense location
    //
    // 支出場所情報を削除します
    //
    //Future<JsonObject> deleteExpenseLocation(DeleteExpenseLocationReq request) async
    test('test deleteExpenseLocation', () async {
      // TODO
    });

    // Register expense location
    //
    // 支出場所情報を登録します
    //
    //Future<RegisterExpenseLocationRes> registerExpenseLocation(RegisterExpenseLocationReq request) async
    test('test registerExpenseLocation', () async {
      // TODO
    });

    // Update expense location
    //
    // 支出場所情報を更新します
    //
    //Future<UpdateExpenseLocationRes> updateExpenseLocation(UpdateExpenseLocationReq request) async
    test('test updateExpenseLocation', () async {
      // TODO
    });

  });
}
