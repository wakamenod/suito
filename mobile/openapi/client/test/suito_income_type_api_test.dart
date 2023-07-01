import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SuitoIncomeTypeApi
void main() {
  final instance = Openapi().getSuitoIncomeTypeApi();

  group(SuitoIncomeTypeApi, () {
    // Register income incomeType
    //
    // 収入種別を登録します
    //
    //Future<RegisterIncomeTypeRes> registerIncomeType(RegisterIncomeTypeReq request) async
    test('test registerIncomeType', () async {
      // TODO
    });

    // Update expense incomeType
    //
    // 収入種別情報を更新します
    //
    //Future<UpdateIncomeTypeRes> updateIncomeType(UpdateIncomeTypeReq request) async
    test('test updateIncomeType', () async {
      // TODO
    });

  });
}
