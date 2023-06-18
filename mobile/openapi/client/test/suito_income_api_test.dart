import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SuitoIncomeApi
void main() {
  final instance = Openapi().getSuitoIncomeApi();

  group(SuitoIncomeApi, () {
    // Get income detail
    //
    // 収入詳細情報を取得します.
    //
    //Future<IncomeDetailRes> incomeDetail(IncomeDetailReq request) async
    test('test incomeDetail', () async {
      // TODO
    });

    // List income types
    //
    // 収入種別一覧を返却します.
    //
    //Future<ListIncomeTypesRes> listIncomeTypes() async
    test('test listIncomeTypes', () async {
      // TODO
    });

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
