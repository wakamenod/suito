import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suito/src/app_theme.dart';
import 'package:suito/src/features/schedules/presentations/expense/expense_schedule_detail_screen.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_controller.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_value.dart';

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
}
