import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suito/src/models/income.dart';
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
      final resIncome = Income(
        id: 'new_income_id',
        amount: income.amount.value,
        localDate: income.date,
        incomeTypeId: income.incomeTypeID,
        memo: income.memo,
      );
      registerFallbackValue(const Income());
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
      registerFallbackValue(const Income());
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
      final resIncome = Income(
        id: 'new_income_id',
        amount: income.amount.value,
        localDate: income.date,
        incomeTypeId: income.incomeTypeID,
        memo: income.memo,
      );
      registerFallbackValue(const Income());
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
      registerFallbackValue(const Income());
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

  group('submitIncomeController mapping', () {
    Future<Income> captureRegistered(IncomeFormValue form) async {
      final registerRepo = MockRegisterIncomeRepository();
      registerFallbackValue(const Income());
      when(() => registerRepo.registerIncome(any()))
          .thenAnswer((_) async => const Income(id: 'new_id'));
      final container = makeProviderContainer(registerRepo: registerRepo);
      await container
          .read(submitIncomeControllerProvider.notifier)
          .submit(form);
      return verify(() => registerRepo.registerIncome(captureAny()))
          .captured
          .single as Income;
    }

    test('truncates the picker timestamp to a date', () async {
      final sent = await captureRegistered(const IncomeFormValue(
          id: '',
          title: Title.dirty('A title'),
          incomeTypeID: 'income_type_id',
          amount: Amount.dirty(400),
          date: '2023-01-05 13:45:00.000',
          memo: 'memo',
          isValid: true));

      expect(sent.localDate, '2023-01-05');
    });

    test('sends no income type as null, not an empty uuid', () async {
      final sent = await captureRegistered(const IncomeFormValue(
          id: '',
          title: Title.dirty('A title'),
          incomeTypeID: '',
          amount: Amount.dirty(400),
          date: '2023-01-05',
          memo: '',
          isValid: true));

      expect(sent.incomeTypeId, isNull);
    });
  });
}
