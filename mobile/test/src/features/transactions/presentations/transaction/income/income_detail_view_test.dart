import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openapi/openapi.dart';

import '../../../../../mocks.dart';
import '../../../transactions_robot.dart';

void main() {
  // TODO エラー時の表示テスト追加

  group('IncomeDetailView Golden test group', () {
    testGoldens('Open IncomeDetailView as registration for new income',
        (tester) async {
      await loadAppFonts();
      final r = TransactionsRobot(tester);
      final now = DateTime(2023, 5, 1);
      await r.pumpIncomeDetailScreen(id: null, now: now);
      await screenMatchesGolden(tester, 'new_income_detail');
    });
  });

  testGoldens('Open IncomeDetailView for updating a registered income',
      (tester) async {
    await loadAppFonts();
    final r = TransactionsRobot(tester);
    final now = DateTime(2023, 5, 1);
    final repository = MockIncomeDetailRepository();
    final incomeTypeRepo = MockIncomeTypesRepository();
    const id = 'income_id';
    final incomeType = ModelIncomeType((e) => e
      ..id = 'income_type_id'
      ..name = 'Test Income Type');
    final res = IncomeDetailRes((r) => r.income.replace(ModelIncome((b) => b
      ..id = id
      ..localDate = '2023-05-03'
      ..memo = 'some memo'
      ..amount = 400
      ..incomeTypeId = incomeType.id)));
    when(() => repository.fetchIncomeDetail(id))
        .thenAnswer((invocation) => Future.value(res));
    when(() => incomeTypeRepo.fetchIncomeTypesList())
        .thenAnswer((invocation) => Future.value([incomeType]));
    await r.pumpIncomeDetailScreen(
        incomeRepo: repository,
        incomeTypeRepo: incomeTypeRepo,
        id: id,
        now: now);
    await screenMatchesGolden(tester, 'update_income_detail');
  });
}
