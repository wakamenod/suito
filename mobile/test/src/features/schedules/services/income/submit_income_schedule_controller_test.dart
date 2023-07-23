import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/schedules/repositories/income/register_income_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/income/update_income_schedule_repository.dart';
import 'package:suito/src/features/schedules/services/income/submit_income_schedule_controller.dart';
import 'package:suito/src/features/transactions/services/income/income_form_value.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart';
import 'package:suito/src/utils/timezone_provider.dart';

import '../../../../mocks.dart';

void main() {
  ProviderContainer makeProviderContainer(
      {MockRegisterIncomeScheduleRepository? registerRepo,
      MockUpdateIncomeScheduleRepository? updateRepo}) {
    final container = ProviderContainer(
      overrides: [
        localTimezoneProvider.overrideWith((ref) => 'Asia/Tokyo'),
        if (registerRepo != null)
          registerIncomeScheduleRepositoryProvider
              .overrideWithValue(registerRepo),
        if (updateRepo != null)
          updateIncomeScheduleRepositoryProvider.overrideWithValue(updateRepo)
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<int>());
  });

  group('submitIncomeScheduleController', () {
    test('register new incomeSchedule, success', () async {
      // setup
      final registerRepo = MockRegisterIncomeScheduleRepository();
      const incomeSchedule = IncomeFormValue(
          id: '',
          date: '',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          incomeTypeID: 'income_type_id',
          memo: 'memo',
          isValid: true);
      final resIncomeSchedule = ModelIncomeSchedule((e) => e
        ..id = 'new_incomeSchedule_id'
        ..timezone = 'Asia/Tokyo'
        ..amount = incomeSchedule.amount.value
        ..incomeTypeId = incomeSchedule.incomeTypeID
        ..memo = incomeSchedule.memo);
      final req = RegisterIncomeScheduleReq(
          (r) => r.incomeSchedule.replace(ModelIncomeSchedule((e) => e
            ..id = incomeSchedule.id
            ..amount = incomeSchedule.amount.value
            ..timezone = 'Asia/Tokyo'
            ..incomeTypeId = incomeSchedule.incomeTypeID
            ..memo = incomeSchedule.memo)));
      registerFallbackValue(req);
      when(() => registerRepo.registerIncomeSchedule(any())).thenAnswer(
        (_) => Future.value(resIncomeSchedule),
      );
      final container = makeProviderContainer(registerRepo: registerRepo);
      final controller =
          container.read(submitIncomeScheduleControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        submitIncomeScheduleControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.submit(incomeSchedule);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => registerRepo.registerIncomeSchedule(any())).called(1);
    });

    test('register new incomeSchedule, failure', () async {
      // setup
      final registerRepo = MockRegisterIncomeScheduleRepository();
      const incomeSchedule = IncomeFormValue(
          id: '',
          date: '',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          incomeTypeID: 'income_type_id',
          memo: 'memo',
          isValid: true);
      final req = RegisterIncomeScheduleReq(
          (r) => r.incomeSchedule.replace(ModelIncomeSchedule((e) => e
            ..id = incomeSchedule.id
            ..amount = incomeSchedule.amount.value
            ..timezone = 'Asia/Tokyo'
            ..incomeTypeId = incomeSchedule.incomeTypeID
            ..memo = incomeSchedule.memo)));
      registerFallbackValue(req);
      when(() => registerRepo.registerIncomeSchedule(any())).thenThrow(
        (_) => Exception("Network error"),
      );
      final container = makeProviderContainer(registerRepo: registerRepo);
      final controller =
          container.read(submitIncomeScheduleControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        submitIncomeScheduleControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.submit(incomeSchedule);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => registerRepo.registerIncomeSchedule(any())).called(1);
    });

    test('update incomeSchedule, success', () async {
      // setup
      final updateRepo = MockUpdateIncomeScheduleRepository();
      const incomeSchedule = IncomeFormValue(
          id: 'incomeSchedule_id',
          date: '',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          incomeTypeID: 'income_type_id',
          memo: 'memo',
          isValid: true);
      final resIncomeSchedule = ModelIncomeSchedule((e) => e
        ..id = incomeSchedule.id
        ..amount = incomeSchedule.amount.value
        ..timezone = 'Asia/Tokyo'
        ..incomeTypeId = incomeSchedule.incomeTypeID
        ..memo = incomeSchedule.memo);
      final req = UpdateIncomeScheduleReq(
          (r) => r.incomeSchedule.replace(ModelIncomeSchedule((e) => e
            ..id = incomeSchedule.id
            ..amount = incomeSchedule.amount.value
            ..timezone = 'Asia/Tokyo'
            ..incomeTypeId = incomeSchedule.incomeTypeID
            ..memo = incomeSchedule.memo)));
      registerFallbackValue(req);
      when(() => updateRepo.updateIncomeSchedule(any())).thenAnswer(
        (_) => Future.value(resIncomeSchedule),
      );
      final container = makeProviderContainer(updateRepo: updateRepo);
      final controller =
          container.read(submitIncomeScheduleControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        submitIncomeScheduleControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.submit(incomeSchedule);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => updateRepo.updateIncomeSchedule(any())).called(1);
    });

    test('update incomeSchedule, failure', () async {
      // setup
      final updateRepo = MockUpdateIncomeScheduleRepository();
      const incomeSchedule = IncomeFormValue(
          id: 'incomeSchedule_id',
          date: '',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          incomeTypeID: 'income_type_id',
          memo: 'memo',
          isValid: true);
      final req = UpdateIncomeScheduleReq(
          (r) => r.incomeSchedule.replace(ModelIncomeSchedule((e) => e
            ..id = incomeSchedule.id
            ..amount = incomeSchedule.amount.value
            ..timezone = 'Asia/Tokyo'
            ..incomeTypeId = incomeSchedule.incomeTypeID
            ..memo = incomeSchedule.memo)));
      registerFallbackValue(req);
      when(() => updateRepo.updateIncomeSchedule(any())).thenThrow(
        (_) => Exception("Network error"),
      );
      final container = makeProviderContainer(updateRepo: updateRepo);
      final controller =
          container.read(submitIncomeScheduleControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        submitIncomeScheduleControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.submit(incomeSchedule);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => updateRepo.updateIncomeSchedule(any())).called(1);
    });

    test('repository is not called if incomeSchedule form value is invalid',
        () async {
      // setup
      final registerRepo = MockRegisterIncomeScheduleRepository();
      final updateRepo = MockUpdateIncomeScheduleRepository();
      const incomeSchedule = IncomeFormValue(
          id: '',
          date: '',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          incomeTypeID: 'income_type_id',
          memo: 'memo',
          isValid: false);
      final container = makeProviderContainer(registerRepo: registerRepo);
      final controller =
          container.read(submitIncomeScheduleControllerProvider.notifier);
      // run
      await controller.submit(incomeSchedule);
      // verify
      verifyNever(() => registerRepo.registerIncomeSchedule(any()));
      verifyNever(() => updateRepo.updateIncomeSchedule(any()));
    });
  });
}
