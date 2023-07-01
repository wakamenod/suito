import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SuitoExpenseCategoryApi
void main() {
  final instance = Openapi().getSuitoExpenseCategoryApi();

  group(SuitoExpenseCategoryApi, () {
    // List expense categories
    //
    // 購入カテゴリー一覧を返却します.
    //
    //Future<ListExpenseCategoriesRes> listExpenseCategories() async
    test('test listExpenseCategories', () async {
      // TODO
    });

    // Register expense category
    //
    // 支出カテゴリー情報を登録します
    //
    //Future<RegisterExpenseCategoryRes> registerExpenseCategory(RegisterExpenseCategoryReq request) async
    test('test registerExpenseCategory', () async {
      // TODO
    });

    // Update expense category
    //
    // 支出カテゴリー情報を更新します
    //
    //Future<UpdateExpenseCategoryRes> updateExpenseCategory(UpdateExpenseCategoryReq request) async
    test('test updateExpenseCategory', () async {
      // TODO
    });

  });
}
