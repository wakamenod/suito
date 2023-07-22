import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transactions/repositories/income/income_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/income_types_repository.dart';
import 'package:suito/src/features/transactions/services/income/income.dart';
import 'package:suito/src/features/transactions/services/income/income_form_controller.dart';

import '../../../../mocks.dart';

void main() {
  late MockIncomeDetailRepository incomeDetailRepository;
  late MockIncomeTypesRepository incomeTypesRepository;

  setUp(() {
    incomeDetailRepository = MockIncomeDetailRepository();
    incomeTypesRepository = MockIncomeTypesRepository();
  });

  ProviderContainer makeProviderContainer() {
    final container = ProviderContainer(
      overrides: [
        incomeDetailRepositoryProvider
            .overrideWithValue(incomeDetailRepository),
        incomeTypesRepositoryProvider.overrideWithValue(incomeTypesRepository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('incomeFormController', () {
    test('register new income - validation valid', () async {
      final container = makeProviderContainer();
      final exp = Income.init(DateTime.now());
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
      final exp = Income.init(DateTime.now());
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

  group('incomeFuture', () {
    test('do not fetch income if id is null', () async {
      // setup
      final container = makeProviderContainer();
      // run
      final income = await container.read(incomeFutureProvider().future);
      // check
      expect(income.id, '');
    });

    test('do fetch income if id is not null', () async {
      // setup
      final container = makeProviderContainer();
      final incomeType = ModelIncomeType((e) => e
        ..id = 'income_location_id'
        ..name = 'Test Location');
      final modelIncome = ModelIncome((e) => e
        ..id = 'test_income_id'
        ..incomeTypeId = incomeType.id
        ..amount = 400
        ..memo = ''
        ..localDate = '2023-05-03');
      when(() => incomeDetailRepository.fetchIncomeDetail(modelIncome.id))
          .thenAnswer((invocation) => Future.value(
              IncomeDetailRes((b) => b.income.replace(modelIncome))));
      when(() => incomeTypesRepository.fetchIncomeTypesList())
          .thenAnswer((invocation) => Future.value([incomeType]));
      // run
      final income =
          await container.read(incomeFutureProvider(id: modelIncome.id).future);
      // check
      expect(income.id, modelIncome.id);
      expect(income.title.value, incomeType.name);
      expect(income.amount.value, modelIncome.amount);
      expect(income.memo, modelIncome.memo);
      expect(income.incomeTypeID, incomeType.id);
    });
  });
}
