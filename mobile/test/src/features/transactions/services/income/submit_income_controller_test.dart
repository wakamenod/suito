import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/transactions/repositories/income/register_income_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/update_income_repository.dart';
import 'package:suito/src/features/transactions/services/income/income_form_value.dart';
import 'package:suito/src/features/transactions/services/income/submit_income_controller.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart';

import '../../../../mocks.dart';

void main() {
  ProviderContainer makeProviderContainer(
      {MockRegisterIncomeRepository? registerRepo,
      MockUpdateIncomeRepository? updateRepo}) {
    final container = ProviderContainer(
      overrides: [
        if (registerRepo != null)
          registerIncomeRepositoryProvider.overrideWithValue(registerRepo),
        if (updateRepo != null)
          updateIncomeRepositoryProvider.overrideWithValue(updateRepo)
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<int>());
  });

  group('submitIncomeController', () {
    test('register new income, success', () async {
      // setup
      final registerRepo = MockRegisterIncomeRepository();
      const income = IncomeFormValue(
          id: '',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          date: '2023-01-05',
          incomeTypeID: 'income_type_id',
          memo: 'memo',
          isValid: true);
      final resIncome = ModelIncome((e) => e
        ..id = 'new_income_id'
        ..amount = income.amount.value
        ..localDate = income.date
        ..incomeTypeId = income.incomeTypeID
        ..memo = income.memo);
      final req = RegisterIncomeReq((r) => r.income.replace(ModelIncome((e) => e
        ..id = income.id
        ..incomeTypeId = income.incomeTypeID
        ..amount = income.amount.value
        ..localDate = income.date
        ..memo = income.memo)));
      registerFallbackValue(req);
      when(() => registerRepo.registerIncome(any())).thenAnswer(
        (_) => Future.value(resIncome),
      );
      final container = makeProviderContainer(registerRepo: registerRepo);
      final controller =
          container.read(submitIncomeControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        submitIncomeControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.submit(income);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => registerRepo.registerIncome(any())).called(1);
    });

    test('register new income, failure', () async {
      // setup
      final registerRepo = MockRegisterIncomeRepository();
      const income = IncomeFormValue(
          id: '',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          date: '2023-01-05',
          incomeTypeID: 'income_type_id',
          memo: 'memo',
          isValid: true);
      final req = RegisterIncomeReq((r) => r.income.replace(ModelIncome((e) => e
        ..id = income.id
        ..amount = income.amount.value
        ..localDate = income.date
        ..incomeTypeId = income.incomeTypeID
        ..memo = income.memo)));
      registerFallbackValue(req);
      when(() => registerRepo.registerIncome(any())).thenThrow(
        (_) => Exception("Network error"),
      );
      final container = makeProviderContainer(registerRepo: registerRepo);
      final controller =
          container.read(submitIncomeControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        submitIncomeControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.submit(income);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => registerRepo.registerIncome(any())).called(1);
    });

    test('update income, success', () async {
      // setup
      final updateRepo = MockUpdateIncomeRepository();
      const income = IncomeFormValue(
          id: 'income_id',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          date: '2023-01-05',
          incomeTypeID: 'income_type_id',
          memo: 'memo',
          isValid: true);
      final resIncome = ModelIncome((e) => e
        ..id = income.id
        ..amount = income.amount.value
        ..localDate = income.date
        ..incomeTypeId = income.incomeTypeID
        ..memo = income.memo);
      final req = UpdateIncomeReq((r) => r.income.replace(ModelIncome((e) => e
        ..id = income.id
        ..amount = income.amount.value
        ..localDate = income.date
        ..incomeTypeId = income.incomeTypeID
        ..memo = income.memo)));
      registerFallbackValue(req);
      when(() => updateRepo.updateIncome(any())).thenAnswer(
        (_) => Future.value(resIncome),
      );
      final container = makeProviderContainer(updateRepo: updateRepo);
      final controller =
          container.read(submitIncomeControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        submitIncomeControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.submit(income);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => updateRepo.updateIncome(any())).called(1);
    });

    test('update income, failure', () async {
      // setup
      final updateRepo = MockUpdateIncomeRepository();
      const income = IncomeFormValue(
          id: 'income_id',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          date: '2023-01-05',
          incomeTypeID: 'income_type_id',
          memo: 'memo',
          isValid: true);
      final req = UpdateIncomeReq((r) => r.income.replace(ModelIncome((e) => e
        ..id = income.id
        ..amount = income.amount.value
        ..localDate = income.date
        ..incomeTypeId = income.incomeTypeID
        ..memo = income.memo)));
      registerFallbackValue(req);
      when(() => updateRepo.updateIncome(any())).thenThrow(
        (_) => Exception("Network error"),
      );
      final container = makeProviderContainer(updateRepo: updateRepo);
      final controller =
          container.read(submitIncomeControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        submitIncomeControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.submit(income);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => updateRepo.updateIncome(any())).called(1);
    });

    test('repository is not called if income form value is invalid', () async {
      // setup
      final registerRepo = MockRegisterIncomeRepository();
      final updateRepo = MockUpdateIncomeRepository();
      const income = IncomeFormValue(
          id: '',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          date: '2023-01-05',
          incomeTypeID: 'income_type_id',
          memo: 'memo',
          isValid: false);
      final container = makeProviderContainer(registerRepo: registerRepo);
      final controller =
          container.read(submitIncomeControllerProvider.notifier);
      // run
      await controller.submit(income);
      // verify
      verifyNever(() => registerRepo.registerIncome(any()));
      verifyNever(() => updateRepo.updateIncome(any()));
    });
  });
}
