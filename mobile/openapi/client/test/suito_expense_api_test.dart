import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SuitoExpenseApi
void main() {
  final instance = Openapi().getSuitoExpenseApi();

  group(SuitoExpenseApi, () {
    // List expense categories
    //
    // 購入カテゴリー一覧を返却します.
    //
    //Future<ListExpenseCategoriesRes> listExpenseCategories() async
    test('test listExpenseCategories', () async {
      // TODO
    });

  });
}
