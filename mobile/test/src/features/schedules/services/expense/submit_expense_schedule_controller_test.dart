import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/schedules/repositories/expense/register_expense_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/expense/update_expense_schedule_repository.dart';
import 'package:suito/src/features/schedules/services/expense/submit_expense_schedule_controller.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_value.dart';
import 'package:suito/src/formz/amount.dart';
import 'package:suito/src/formz/title.dart';
import 'package:suito/src/utils/timezone_provider.dart';

import '../../../../mocks.dart';

void main() {
  ProviderContainer makeProviderContainer(
      {MockRegisterExpenseScheduleRepository? registerRepo,
      MockUpdateExpenseScheduleRepository? updateRepo}) {
    final container = ProviderContainer(
      overrides: [
        localTimezoneProvider.overrideWith((ref) => 'Asia/Tokyo'),
        if (registerRepo != null)
          registerExpenseScheduleRepositoryProvider
              .overrideWithValue(registerRepo),
        if (updateRepo != null)
          updateExpenseScheduleRepositoryProvider.overrideWithValue(updateRepo)
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<int>());
  });

  group('submitExpenseScheduleController', () {
    test('register new expenseSchedule, success', () async {
      // setup
      final registerRepo = MockRegisterExpenseScheduleRepository();
      const expenseSchedule = ExpenseFormValue(
          id: '',
          date: '',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          categoryID: 'category_id',
          category: 'A category',
          locationID: 'location_id',
          location: 'A locatin',
          memo: 'memo',
          isValid: true);
      final resExpenseSchedule = ModelExpenseSchedule((e) => e
        ..id = 'new_expenseSchedule_id'
        ..timezone = 'Asia/Tokyo'
        ..title = expenseSchedule.title.value
        ..amount = expenseSchedule.amount.value
        ..expenseCategoryID = expenseSchedule.categoryID
        ..expenseLocationID = expenseSchedule.locationID
        ..memo = expenseSchedule.memo);
      final req = RegisterExpenseScheduleReq(
          (r) => r.expenseSchedule.replace(ModelExpenseSchedule((e) => e
            ..id = expenseSchedule.id
            ..title = expenseSchedule.title.value
            ..amount = expenseSchedule.amount.value
            ..timezone = 'Asia/Tokyo'
            ..expenseCategoryID = expenseSchedule.categoryID
            ..expenseLocationID = expenseSchedule.locationID
            ..memo = expenseSchedule.memo)));
      registerFallbackValue(req);
      when(() => registerRepo.registerExpenseSchedule(any())).thenAnswer(
        (_) => Future.value(resExpenseSchedule),
      );
      final container = makeProviderContainer(registerRepo: registerRepo);
      final controller =
          container.read(submitExpenseScheduleControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        submitExpenseScheduleControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.submit(expenseSchedule);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => registerRepo.registerExpenseSchedule(any())).called(1);
    });

    test('register new expenseSchedule, failure', () async {
      // setup
      final registerRepo = MockRegisterExpenseScheduleRepository();
      const expenseSchedule = ExpenseFormValue(
          id: '',
          date: '',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          categoryID: 'category_id',
          category: 'A category',
          locationID: 'location_id',
          location: 'A locatin',
          memo: 'memo',
          isValid: true);
      final req = RegisterExpenseScheduleReq(
          (r) => r.expenseSchedule.replace(ModelExpenseSchedule((e) => e
            ..id = expenseSchedule.id
            ..title = expenseSchedule.title.value
            ..amount = expenseSchedule.amount.value
            ..timezone = 'Asia/Tokyo'
            ..expenseCategoryID = expenseSchedule.categoryID
            ..expenseLocationID = expenseSchedule.locationID
            ..memo = expenseSchedule.memo)));
      registerFallbackValue(req);
      when(() => registerRepo.registerExpenseSchedule(any())).thenThrow(
        (_) => Exception("Network error"),
      );
      final container = makeProviderContainer(registerRepo: registerRepo);
      final controller =
          container.read(submitExpenseScheduleControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        submitExpenseScheduleControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.submit(expenseSchedule);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => registerRepo.registerExpenseSchedule(any())).called(1);
    });

    test('update expenseSchedule, success', () async {
      // setup
      final updateRepo = MockUpdateExpenseScheduleRepository();
      const expenseSchedule = ExpenseFormValue(
          id: 'expenseSchedule_id',
          date: '',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          categoryID: 'category_id',
          category: 'A category',
          locationID: 'location_id',
          location: 'A locatin',
          memo: 'memo',
          isValid: true);
      final resExpenseSchedule = ModelExpenseSchedule((e) => e
        ..id = expenseSchedule.id
        ..title = expenseSchedule.title.value
        ..amount = expenseSchedule.amount.value
        ..timezone = 'Asia/Tokyo'
        ..expenseCategoryID = expenseSchedule.categoryID
        ..expenseLocationID = expenseSchedule.locationID
        ..memo = expenseSchedule.memo);
      final req = UpdateExpenseScheduleReq(
          (r) => r.expenseSchedule.replace(ModelExpenseSchedule((e) => e
            ..id = expenseSchedule.id
            ..title = expenseSchedule.title.value
            ..amount = expenseSchedule.amount.value
            ..timezone = 'Asia/Tokyo'
            ..expenseCategoryID = expenseSchedule.categoryID
            ..expenseLocationID = expenseSchedule.locationID
            ..memo = expenseSchedule.memo)));
      registerFallbackValue(req);
      when(() => updateRepo.updateExpenseSchedule(any())).thenAnswer(
        (_) => Future.value(resExpenseSchedule),
      );
      final container = makeProviderContainer(updateRepo: updateRepo);
      final controller =
          container.read(submitExpenseScheduleControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        submitExpenseScheduleControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.submit(expenseSchedule);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => updateRepo.updateExpenseSchedule(any())).called(1);
    });

    test('update expenseSchedule, failure', () async {
      // setup
      final updateRepo = MockUpdateExpenseScheduleRepository();
      const expenseSchedule = ExpenseFormValue(
          id: 'expenseSchedule_id',
          date: '',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          categoryID: 'category_id',
          category: 'A category',
          locationID: 'location_id',
          location: 'A locatin',
          memo: 'memo',
          isValid: true);
      final req = UpdateExpenseScheduleReq(
          (r) => r.expenseSchedule.replace(ModelExpenseSchedule((e) => e
            ..id = expenseSchedule.id
            ..title = expenseSchedule.title.value
            ..amount = expenseSchedule.amount.value
            ..timezone = 'Asia/Tokyo'
            ..expenseCategoryID = expenseSchedule.categoryID
            ..expenseLocationID = expenseSchedule.locationID
            ..memo = expenseSchedule.memo)));
      registerFallbackValue(req);
      when(() => updateRepo.updateExpenseSchedule(any())).thenThrow(
        (_) => Exception("Network error"),
      );
      final container = makeProviderContainer(updateRepo: updateRepo);
      final controller =
          container.read(submitExpenseScheduleControllerProvider.notifier);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        submitExpenseScheduleControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      await controller.submit(expenseSchedule);
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => updateRepo.updateExpenseSchedule(any())).called(1);
    });

    test('repository is not called if expenseSchedule form value is invalid',
        () async {
      // setup
      final registerRepo = MockRegisterExpenseScheduleRepository();
      final updateRepo = MockUpdateExpenseScheduleRepository();
      const expenseSchedule = ExpenseFormValue(
          id: '',
          date: '',
          title: Title.dirty('A title'),
          amount: Amount.dirty(400),
          categoryID: 'category_id',
          category: 'A category',
          locationID: 'location_id',
          location: 'A locatin',
          memo: 'memo',
          isValid: false);
      final container = makeProviderContainer(registerRepo: registerRepo);
      final controller =
          container.read(submitExpenseScheduleControllerProvider.notifier);
      // run
      await controller.submit(expenseSchedule);
      // verify
      verifyNever(() => registerRepo.registerExpenseSchedule(any()));
      verifyNever(() => updateRepo.updateExpenseSchedule(any()));
    });
  });
}
