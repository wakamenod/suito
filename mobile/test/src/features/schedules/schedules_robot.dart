import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suito/src/app_theme.dart';
import 'package:suito/src/features/schedules/presentations/expense/expense_schedule_detail_screen.dart';
import 'package:suito/src/features/schedules/presentations/income/income_schedule_detail_screen.dart';
import 'package:suito/src/features/schedules/presentations/schedule_screen.dart';
import 'package:suito/src/features/schedules/repositories/schedules_repository.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_controller.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_value.dart';
import 'package:suito/src/features/transactions/services/income/income_form_controller.dart';
import 'package:suito/src/features/transactions/services/income/income_form_value.dart';

class SchedulesRobot {
  SchedulesRobot(this.tester);
  final WidgetTester tester;

  Future<void> pumpExpenseDetailScreen(ExpenseFormValue value) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          expenseFormInitialValueProvider.overrideWith((ref) => value),
        ],
        child: MaterialApp(
            home: const ExpenseScheduleDetailScreen(),
            theme: AppTheme().create()),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> pumpIncomeDetailScreen(IncomeFormValue value) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          incomeFormInitialValueProvider.overrideWith((ref) => value),
        ],
        child: MaterialApp(
            home: const IncomeScheduleDetailScreen(),
            theme: AppTheme().create()),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> pumpSchedulesScreen({
    SchedulesRepository? repository,
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (repository != null)
            schedulesRepositoryProvider.overrideWithValue(repository)
        ],
        child: MaterialApp(
            home: const ScheduleScreen(), theme: AppTheme().create()),
      ),
    );
    await tester.pumpAndSettle();
  }
}
