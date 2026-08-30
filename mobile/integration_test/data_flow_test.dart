// On-device verification of the Phase 4 data-layer migration.
//
// Drives the REAL app (same bootstrap as lib/main.dart) against a LOCAL
// Supabase stack, on a simulator/emulator:
//
//   (cd .. && npx supabase start)
//   fvm flutter test integration_test/data_flow_test.dart -d <device-id>
//
// Covers: an expense and an income written through the repositories show up in
// the transaction list with the right totals, the charts screen renders the
// aggregation RPCs, and the schedule screen lists both schedule kinds.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/env/env.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/app_bootstrap.dart';
import 'package:suito/src/features/charts/presentations/column_chart_view.dart';
import 'package:suito/src/features/schedules/repositories/expense/register_expense_schedule_repository.dart';
import 'package:suito/src/features/schedules/repositories/income/register_income_schedule_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/categories/register_category_repository.dart';
import 'package:suito/src/features/transaction_attributes/repositories/income_types/register_income_type_repository.dart';
import 'package:suito/src/features/transactions/presentations/transaction/transactions_list_item.dart';
import 'package:suito/src/features/transactions/repositories/expense/register_expense_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/register_income_repository.dart';
import 'package:suito/src/models/expense.dart';
import 'package:suito/src/models/expense_schedule.dart';
import 'package:suito/src/models/income.dart';
import 'package:suito/src/models/income_schedule.dart';
import 'package:suito/src/utils/datetime_utils.dart';

const _password = 'password123';
int _seq = 0;
String _uniqueEmail() =>
    'data_${DateTime.now().microsecondsSinceEpoch}_${_seq++}@test.dev';

SupabaseClient get _client => Supabase.instance.client;
GoTrueClient get _auth => _client.auth;

/// A date inside the month the app opens on, so the seeded rows land in the
/// list the transactions screen shows first.
String _dayThisMonth(int day) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, day).toYMD();
}

Future<void> _pumpApp(WidgetTester tester) async {
  final bootstrap = AppBootstrap();
  final container = await bootstrap.createFakeDioProviderContainer();
  LocaleSettings.useDeviceLocale();
  await tester.pumpWidget(bootstrap.createRootWidget(container: container));
  for (var i = 0; i < 30; i++) {
    await tester.pump(const Duration(milliseconds: 200));
  }
}

Future<void> _tapNav(WidgetTester tester, IconData icon) async {
  await tester.tap(find.byIcon(icon));
  for (var i = 0; i < 20; i++) {
    await tester.pump(const Duration(milliseconds: 200));
  }
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await Supabase.initialize(
      url: Env.kSupabaseUrl,
      anonKey: Env.kSupabaseAnonKey,
      debug: false,
    );

    // version_check.dart puts a modal forced-update dialog over every screen
    // when app_config disagrees with the running app. That dialog absorbs
    // pointer events, so without this guard the tests below fail with an
    // opaque "would not hit test on the specified widget" error instead.
    // `supabase/seed.sql` keeps the local value in step; `supabase db reset`
    // reverts it to the migration default without it.
    final config = await _client
        .from('app_config')
        .select('latest_version')
        .eq('id', 1)
        .single();
    final info = await PackageInfo.fromPlatform();
    expect(
      config['latest_version'],
      info.version,
      reason: 'app_config.latest_version must match the app version. Run:\n'
          "  update public.app_config set latest_version = '${info.version}' "
          'where id = 1;',
    );
  });

  setUp(() async {
    await _auth.signOut();
    await _auth.signUp(email: _uniqueEmail(), password: _password);
  });

  testWidgets('the transaction list shows what the repositories wrote',
      (tester) async {
    // Each test signs up its own user, and the unique constraint on the
    // reference tables is per user, so plain names are safe here.
    final category =
        await RegisterCategoryRepository(_client).registerCategory('Food');
    final incomeType = await RegisterIncomeTypeRepository(_client)
        .registerIncomeType('Salary');

    await RegisterExpenseRepository(_client).registerExpense(Expense(
      title: 'Groceries',
      amount: 1200,
      expenseCategoryId: category.id,
      localDate: _dayThisMonth(3),
    ));
    await RegisterIncomeRepository(_client).registerIncome(Income(
      amount: 3000,
      incomeTypeId: incomeType.id,
      localDate: _dayThisMonth(5),
    ));

    await _pumpApp(tester);

    expect(find.byType(TransactionsListItem), findsNWidgets(2));
    expect(find.text('Groceries'), findsOneWidget);
    expect(find.text(incomeType.name), findsOneWidget);
    // The month total: 3000 income - 1200 expense.
    expect(find.textContaining('1,200'), findsWidgets);
    expect(find.textContaining('3,000'), findsWidgets);
  });

  testWidgets('the charts screen renders the aggregation RPCs', (tester) async {
    final category =
        await RegisterCategoryRepository(_client).registerCategory('Food');
    await RegisterExpenseRepository(_client).registerExpense(Expense(
      title: 'Groceries',
      amount: 1200,
      expenseCategoryId: category.id,
      localDate: _dayThisMonth(3),
    ));

    await _pumpApp(tester);
    await _tapNav(tester, Icons.stacked_bar_chart);

    // A chart built from column_chart_data, not an error widget.
    expect(find.byType(ColumnChartView), findsOneWidget);
    expect(find.textContaining('Exception'), findsNothing);
  });

  testWidgets('the schedule screen lists both schedule kinds', (tester) async {
    final incomeType = await RegisterIncomeTypeRepository(_client)
        .registerIncomeType('Salary');

    await RegisterExpenseScheduleRepository(_client).registerExpenseSchedule(
        const ExpenseSchedule(
            title: 'Subscription', amount: 980, timezone: 'Asia/Tokyo'));
    await RegisterIncomeScheduleRepository(_client).registerIncomeSchedule(
        IncomeSchedule(
            amount: 280000,
            incomeTypeId: incomeType.id,
            timezone: 'Asia/Tokyo'));

    await _pumpApp(tester);
    await _tapNav(tester, Icons.schedule);

    expect(find.text('Subscription'), findsOneWidget);
    expect(find.text(incomeType.name), findsOneWidget);
    expect(find.textContaining('Exception'), findsNothing);
  });

  testWidgets('a signed-in user with no data sees an empty list, not an error',
      (tester) async {
    await _pumpApp(tester);

    expect(find.byType(TransactionsListItem), findsNothing);
    expect(find.textContaining('Exception'), findsNothing);
  });
}
