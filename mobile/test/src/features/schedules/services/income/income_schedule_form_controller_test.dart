import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/schedules/services/income/income_schedule.dart';
import 'package:suito/src/features/schedules/services/income/income_schedule_form_controller.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';

void main() {
  ProviderContainer makeProviderContainer() {
    final container = ProviderContainer(
      overrides: [],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('incomeScheduleFormController', () {
    test('register new income schedule - validation valid', () async {
      final container = makeProviderContainer();
      final exp = IncomeSchedule.init();
      final controller =
          container.read(incomeScheduleFormControllerProvider(exp).notifier);
      final incomeType = AttributeEntry('income_type_id', 'Income Title');
      const amount = 4000;
      const memo = 'Memo';
      // run
      controller.onChangeTitle(incomeType);
      controller.onChangeAmount(amount);
      controller.onChangeMemo(memo);
      // verify
      final state = container.read(incomeScheduleFormControllerProvider(exp));
      expect(state.title.value, incomeType.name);
      expect(state.amount.value, amount);
      expect(state.incomeTypeID, incomeType.id);
      expect(state.memo, memo);
      expect(state.isValid, true);
    });

    test('register new income schedule - validation invalid', () async {
      final container = makeProviderContainer();
      final exp = IncomeSchedule.init();
      final controller =
          container.read(incomeScheduleFormControllerProvider(exp).notifier);
      const memo = 'Memo';
      // run
      controller.onChangeMemo(memo);
      // verify
      final state = container.read(incomeScheduleFormControllerProvider(exp));
      expect(state.memo, memo);
      expect(state.isValid, false);
    });

    test('update income schedule - validation invalid', () async {
      final container = makeProviderContainer();
      final incomeTypeMap = {
        "income_type_id": ModelIncomeType((b) => b.name = 'A Income Type')
      };
      final res = IncomeScheduleDetailRes(
          (r) => r.incomeSchedule.replace(ModelIncomeSchedule((b) => b
            ..id = 'income_id'
            ..timezone = 'Asia/Tokyo'
            ..memo = ''
            ..amount = 400
            ..incomeTypeId = 'income_type_id')));
      final exp = IncomeSchedule.fromModel(res, incomeTypeMap);
      final controller =
          container.read(incomeScheduleFormControllerProvider(exp).notifier);
      const memo = 'Memo';
      // run
      controller.onChangeTitle(null);
      controller.onChangeMemo(memo);
      // verify
      final state = container.read(incomeScheduleFormControllerProvider(exp));
      expect(state.title.value, '');
      expect(state.incomeTypeID, '');
      expect(state.memo, memo);
      expect(state.isValid, false);
    });

    test('update income schedule - validation valid', () async {
      final container = makeProviderContainer();
      final incomeTypeMap = {
        "income_type_id": ModelIncomeType((b) => b.name = 'A Income Type')
      };
      final res = IncomeScheduleDetailRes(
          (r) => r.incomeSchedule.replace(ModelIncomeSchedule((b) => b
            ..id = 'income_id'
            ..timezone = 'Asia/Tokyo'
            ..memo = ''
            ..amount = 400
            ..incomeTypeId = 'income_type_id')));
      final exp = IncomeSchedule.fromModel(res, incomeTypeMap);
      final controller =
          container.read(incomeScheduleFormControllerProvider(exp).notifier);
      const memo = 'Memo';
      // run
      controller.onChangeMemo(memo);
      // verify
      final state = container.read(incomeScheduleFormControllerProvider(exp));
      expect(state.memo, memo);
      expect(state.isValid, true);
    });
  });
}
