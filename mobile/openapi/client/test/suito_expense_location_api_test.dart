import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SuitoExpenseLocationApi
void main() {
  final instance = Openapi().getSuitoExpenseLocationApi();

  group(SuitoExpenseLocationApi, () {
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
    //Future<GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes> updateExpenseLocation(UpdateExpenseLocationReq request) async
    test('test updateExpenseLocation', () async {
      // TODO
    });

  });
}
