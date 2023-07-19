import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transactions/services/income/income.dart';
import 'package:suito/src/features/transactions/services/income/income_form_controller.dart';

void main() {
  ProviderContainer makeProviderContainer() {
    final container = ProviderContainer(
      overrides: [],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('incomeFormController', () {
    test('register new income - validation valid', () async {
      final container = makeProviderContainer();
      final exp = Income.init();
      final controller =
          container.read(incomeFormControllerProvider(exp).notifier);
      final incomeType = AttributeEntry('income_type_id', 'Income Title');
      const amount = 4000;
      const memo = 'Memo';
      const date = '2023-05-03';
      // run
      controller.onChangeTitle(incomeType);
      controller.onChangeAmount(amount);
      controller.onChangeMemo(memo);
      controller.onChangeDate(date);
      // verify
      final state = container.read(incomeFormControllerProvider(exp));
      expect(state.title.value, incomeType.name);
      expect(state.amount.value, amount);
      expect(state.incomeTypeID, incomeType.id);
      expect(state.memo, memo);
      expect(state.date, date);
      expect(state.isValid, true);
    });

    test('register new income - validation invalid', () async {
      final container = makeProviderContainer();
      final exp = Income.init();
      final controller =
          container.read(incomeFormControllerProvider(exp).notifier);
      const memo = 'Memo';
      const date = '2023-05-03';
      // run
      controller.onChangeMemo(memo);
      controller.onChangeDate(date);
      // verify
      final state = container.read(incomeFormControllerProvider(exp));
      expect(state.memo, memo);
      expect(state.date, date);
      expect(state.isValid, false);
    });

    test('update income - validation invalid', () async {
      final container = makeProviderContainer();
      final incomeTypeMap = {
        "income_type_id": ModelIncomeType((b) => b.name = 'A Income Type')
      };
      final res = IncomeDetailRes((r) => r.income.replace(ModelIncome((b) => b
        ..id = 'income_id'
        ..localDate = '2023-05-03'
        ..memo = ''
        ..amount = 400
        ..incomeTypeId = 'income_type_id')));
      final exp = Income.fromModel(res, incomeTypeMap);
      final controller =
          container.read(incomeFormControllerProvider(exp).notifier);
      const memo = 'Memo';
      const date = '2023-05-03';
      // run
      controller.onChangeTitle(null);
      controller.onChangeMemo(memo);
      controller.onChangeDate(date);
      // verify
      final state = container.read(incomeFormControllerProvider(exp));
      expect(state.title.value, '');
      expect(state.incomeTypeID, '');
      expect(state.memo, memo);
      expect(state.date, date);
      expect(state.isValid, false);
    });

    test('update income - validation valid', () async {
      final container = makeProviderContainer();
      final incomeTypeMap = {
        "income_type_id": ModelIncomeType((b) => b.name = 'A Income Type')
      };
      final res = IncomeDetailRes((r) => r.income.replace(ModelIncome((b) => b
        ..id = 'income_id'
        ..localDate = '2023-05-03'
        ..memo = ''
        ..amount = 400
        ..incomeTypeId = 'income_type_id')));
      final exp = Income.fromModel(res, incomeTypeMap);
      final controller =
          container.read(incomeFormControllerProvider(exp).notifier);
      const memo = 'Memo';
      const date = '2023-05-03';
      // run
      controller.onChangeMemo(memo);
      controller.onChangeDate(date);
      // verify
      final state = container.read(incomeFormControllerProvider(exp));
      expect(state.memo, memo);
      expect(state.date, date);
      expect(state.isValid, true);
    });
  });
}
