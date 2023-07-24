import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_value.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart';

import '../../../../../mocks.dart';
import '../../../memo_robot.dart';

void main() {
  group('ExpenseMemoScreen Golden test group', () {
    testGoldens('Open blank memo screen', (tester) async {
      await loadAppFonts();
      final r = MemoRobot(tester);
      final now = DateTime(2023, 5, 1);
      await r.pumpMemoScreen(ExpenseFormValue.newExpense(now));
      await screenMatchesGolden(tester, 'blank_memo_screen');
    });

    testGoldens('Open non blank memo screen', (tester) async {
      await loadAppFonts();
      final r = MemoRobot(tester);
      const memo =
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt facilisis sollicitudin. Vivamus quis convallis ipsum. Nulla malesuada nunc ipsum, lobortis iaculis dolor egestas eu. Quisque aliquam cursus erat ornare tincidunt. Nunc venenatis tellus hendrerit quam viverra, sit amet iaculis dolor lacinia. Quisque ac sapien non nulla sodales facilisis non ac nunc. Sed quis tristique lorem. Suspendisse condimentum ultricies ante, eget faucibus nunc tristique ac. Maecenas turpis elit, iaculis vitae eros ac, ullamcorper placerat velit. Morbi et quam augue. Nunc at nulla nec ligula semper ultricies.";
      await r.pumpMemoScreen(const ExpenseFormValue(
          memo: memo,
          id: 'test_id',
          title: Title.pure(),
          locationID: '',
          categoryID: '',
          category: '',
          amount: Amount.pure(),
          location: '',
          isValid: true,
          date: ''));
      await screenMatchesGolden(tester, 'non_blank_memo_screen');
    });
  });

  group('ExpenseMemoScreen', () {
    testWidgets("Open memo, fill in the text form, then pop the screen",
        (tester) async {
      final r = MemoRobot(tester);
      final now = DateTime(2023, 5, 1);
      final router = MockGoRouter();
      await r.pumpMemoScreen(ExpenseFormValue.newExpense(now), router: router);
      r.expectMemoFieldFound();
      const testMemo = 'This is a test memo';
      await r.enterMemo(testMemo);
      await r.tapBackButton();
      verify(() => router.pop(testMemo)).called(1);
    });
  });
}
