import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SuitoIncomeApi
void main() {
  final instance = Openapi().getSuitoIncomeApi();

  group(SuitoIncomeApi, () {
    // Register income
    //
    // 収入情報を登録します
    //
    //Future<RegisterIncomeRes> registerIncome(RegisterIncomeReq request) async
    test('test registerIncome', () async {
      // TODO
    });

  });
}
