// Schedule repositories against a LOCAL Supabase stack. Also covers the piece
// that moved from the Go create path into the database: the `enqueue_after_insert`
// trigger and its timezone arithmetic.
@Tags(['supabase'])
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/features/schedules/repositories/expense/delete_expense_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/expense/expense_schedule_detail_repository.dart';
import 'package:suito/src/features/schedules/repositories/expense/register_expense_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/expense/update_expense_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/income/delete_income_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/income/income_schedule_detail_repository.dart';
import 'package:suito/src/features/schedules/repositories/income/register_income_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/income/update_income_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/schedules_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/income_types/register_income_type_repository.dart';
import 'package:suito/src/models/expense_schedule.dart';
import 'package:suito/src/models/income_schedule.dart';

import 'supabase_test_stack.dart';

/// The instant `enqueue_transaction_schedules()` should pick for a schedule in
/// [timezone]: the 1st of next month at 03:00 local. Asia/Tokyo is a fixed
/// UTC+9 with no DST, so the offset can be applied directly.
DateTime expectedTokyoEnqueue() {
  const offset = Duration(hours: 9);
  final tokyoNow = DateTime.now().toUtc().add(offset);
  final localTarget = DateTime.utc(tokyoNow.year, tokyoNow.month + 1, 1, 3);
  return localTarget.subtract(offset);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(initSupabaseForTests);
  setUp(signUpFreshUser);

  late final registerExpenseSchedule =
      RegisterExpenseScheduleRepository(supabase);
  late final updateExpenseSchedule = UpdateExpenseScheduleRepository(supabase);
  late final deleteExpenseSchedule = DeleteExpenseScheduleRepository(supabase);
  late final expenseScheduleDetail = ExpenseScheduleDetailRepository(supabase);
  late final registerIncomeSchedule =
      RegisterIncomeScheduleRepository(supabase);
  late final updateIncomeSchedule = UpdateIncomeScheduleRepository(supabase);
  late final deleteIncomeSchedule = DeleteIncomeScheduleRepository(supabase);
  late final incomeScheduleDetail = IncomeScheduleDetailRepository(supabase);
  late final schedules = SchedulesRepository(supabase);
  late final registerIncomeType = RegisterIncomeTypeRepository(supabase);

  group('expense schedule CRUD', () {
    test('registers, reads back, updates and soft deletes', () async {
      final created = await registerExpenseSchedule
          .registerExpenseSchedule(const ExpenseSchedule(
        title: 'Subscription',
        amount: 980,
        memo: 'monthly',
        timezone: 'Asia/Tokyo',
      ));
      expect(created.id, isNotEmpty);

      final fetched =
          await expenseScheduleDetail.fetchExpenseScheduleDetail(created.id);
      expect(fetched.title, 'Subscription');
      expect(fetched.timezone, 'Asia/Tokyo');

      final updated = await updateExpenseSchedule
          .updateExpenseSchedule(fetched.copyWith(amount: 1480));
      expect(updated.amount, 1480);

      await deleteExpenseSchedule.deleteExpenseSchedule(created.id);
      await expectLater(
        expenseScheduleDetail.fetchExpenseScheduleDetail(created.id),
        throwsA(isA<PostgrestException>()),
      );
    });
  });

  group('income schedule CRUD', () {
    test('registers, reads back, updates and soft deletes', () async {
      final type = await registerIncomeType.registerIncomeType(uniqueName('T'));

      final created = await registerIncomeSchedule.registerIncomeSchedule(
          IncomeSchedule(
              amount: 200000, incomeTypeId: type.id, timezone: 'Asia/Tokyo'));

      final fetched =
          await incomeScheduleDetail.fetchIncomeScheduleDetail(created.id);
      expect(fetched.amount, 200000);
      expect(fetched.incomeTypeId, type.id);

      final updated = await updateIncomeSchedule
          .updateIncomeSchedule(fetched.copyWith(amount: 210000));
      expect(updated.amount, 210000);

      await deleteIncomeSchedule.deleteIncomeSchedule(created.id);
      await expectLater(
        incomeScheduleDetail.fetchIncomeScheduleDetail(created.id),
        throwsA(isA<PostgrestException>()),
      );
    });
  });

  group('schedule list', () {
    test('keeps the expense title and borrows the income type name', () async {
      final type = await registerIncomeType.registerIncomeType(uniqueName('T'));
      await registerExpenseSchedule.registerExpenseSchedule(
          const ExpenseSchedule(
              title: 'Rent', amount: 80000, timezone: 'Asia/Tokyo'));
      await registerIncomeSchedule.registerIncomeSchedule(IncomeSchedule(
          amount: 200000, incomeTypeId: type.id, timezone: 'Asia/Tokyo'));

      final res = await schedules.fetchSchedulesList();

      expect(res.expenseSchedules.single.title, 'Rent');
      expect(res.expenseSchedules.single.amount, 80000);
      expect(res.incomeSchedules.single.title, type.name);
      expect(res.incomeSchedules.single.amount, 200000);
    });

    test('drops soft-deleted schedules', () async {
      final created = await registerExpenseSchedule.registerExpenseSchedule(
          const ExpenseSchedule(
              title: 'Rent', amount: 80000, timezone: 'Asia/Tokyo'));

      await deleteExpenseSchedule.deleteExpenseSchedule(created.id);

      expect((await schedules.fetchSchedulesList()).expenseSchedules, isEmpty);
    });

    test('is empty for a new user', () async {
      final res = await schedules.fetchSchedulesList();
      expect(res.expenseSchedules, isEmpty);
      expect(res.incomeSchedules, isEmpty);
    });
  });

  group('enqueue trigger', () {
    test('an inserted expense schedule is queued for 03:00 local next month',
        () async {
      final created = await registerExpenseSchedule.registerExpenseSchedule(
          const ExpenseSchedule(
              title: 'Rent', amount: 80000, timezone: 'Asia/Tokyo'));

      final rows = await supabase
          .from('scheduled_expense_queue')
          .select('expense_schedule_id, scheduled_at')
          .eq('expense_schedule_id', created.id);

      expect(rows, hasLength(1),
          reason: 'the AFTER INSERT trigger replaces the Go sync enqueue');
      expect(
        DateTime.parse(rows.single['scheduled_at'] as String).toUtc(),
        expectedTokyoEnqueue(),
      );
    });

    test('an inserted income schedule is queued too', () async {
      final type = await registerIncomeType.registerIncomeType(uniqueName('T'));
      final created = await registerIncomeSchedule.registerIncomeSchedule(
          IncomeSchedule(
              amount: 200000, incomeTypeId: type.id, timezone: 'Asia/Tokyo'));

      final rows = await supabase
          .from('scheduled_income_queue')
          .select('income_schedule_id, scheduled_at')
          .eq('income_schedule_id', created.id);

      expect(rows, hasLength(1));
      expect(
        DateTime.parse(rows.single['scheduled_at'] as String).toUtc(),
        expectedTokyoEnqueue(),
      );
    });
  });

  group('RLS', () {
    test('one user never sees another user\'s schedules', () async {
      await registerExpenseSchedule.registerExpenseSchedule(
          const ExpenseSchedule(
              title: 'Private', amount: 1, timezone: 'Asia/Tokyo'));

      await signUpFreshUser();

      expect((await schedules.fetchSchedulesList()).expenseSchedules, isEmpty);
    });
  });
}
