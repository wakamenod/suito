import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SuitoExpenseApi
void main() {
  final instance = Openapi().getSuitoExpenseApi();

  group(SuitoExpenseApi, () {
    // Get expense detail
    //
    // 購入詳細情報を取得します.
    //
    //Future<ExpenseDetailRes> expenseDetail(ExpenseDetailReq request) async
    test('test expenseDetail', () async {
      // TODO
    });

    // List expense categories
    //
    // 購入カテゴリー一覧を返却します.
    //
    //Future<ListExpenseCategoriesRes> listExpenseCategories() async
    test('test listExpenseCategories', () async {
      // TODO
    });

    // List expense locations
    //
    // 購入場所ー一覧を返却します.
    //
    //Future<ListExpenseLocationsRes> listExpenseLocations() async
    test('test listExpenseLocations', () async {
      // TODO
    });

    // Register expense
    //
    // 支出情報を登録します
    //
    //Future<RegisterExpenseRes> registerExpense(RegisterExpenseReq request) async
    test('test registerExpense', () async {
      // TODO
    });

  });
}
