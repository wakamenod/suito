import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suito/src/app_theme.dart';
import 'package:suito/src/common_widgets/transition_text_field.dart';
import 'package:suito/src/features/transactions/presentations/expense/expense_detail_screen.dart';
import 'package:suito/src/features/transactions/presentations/incomes/income_detail_screen.dart';
import 'package:suito/src/features/transactions/presentations/transaction/transactions_list_empty_label.dart';
import 'package:suito/src/features/transactions/presentations/transactions_screen.dart';
import 'package:suito/src/features/transactions/repositories/transaction/transaction_months_repository.dart';
import 'package:suito/src/features/transactions/repositories/transaction/transactions_repository.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_controller.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_value.dart';
import 'package:suito/src/features/transactions/services/income/income_form_controller.dart';
import 'package:suito/src/features/transactions/services/income/income_form_value.dart';
import 'package:suito/src/utils/datetime_utils.dart';

class TransactionsRobot {
  TransactionsRobot(this.tester);
  final WidgetTester tester;

  Future<void> pumpTransactionsScreen(
      {TransactionsRepository? transactionsRepo,
      TransactionMonthsRepository? monthsRepo,
      required DateTime now}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          currentTimeProvider.overrideWithValue(now),
          if (transactionsRepo != null)
            transactionsRepositoryProvider.overrideWithValue(transactionsRepo),
          if (monthsRepo != null)
            transactionMonthsRepositoryProvider.overrideWithValue(monthsRepo),
        ],
        child: MaterialApp(
            home: const TransactionsScreen(), theme: AppTheme().create()),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> pumpExpenseDetailScreen(ExpenseFormValue value) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          expenseFormInitialValueProvider.overrideWith((ref) => value),
        ],
        child: MaterialApp(
            home: const ExpenseDetailScreen(), theme: AppTheme().create()),
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
            home: const IncomeDetailScreen(), theme: AppTheme().create()),
      ),
    );
    await tester.pumpAndSettle();
  }

  void expectEmptyLabelFound() {
    expect(find.byType(TransactionsListEmptyLabel), findsOneWidget);
  }

  Future<void> tapToggleButton() async {
    final dropdownButton = find.byType(DropdownButton2<String>);
    expect(dropdownButton, findsOneWidget);
    await tester.tap(dropdownButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapDatePicker() async {
    final calenderIcon = find.byIcon(Icons.calendar_today);
    expect(calenderIcon, findsOneWidget);
    await tester.tap(calenderIcon);
    await tester.pumpAndSettle();
  }

  Finder expectDropdownMenuItemFound(String month) {
    final parentItemFinder = find.byType(DropdownMenuItem<String>);
    final childTextFinder = find.descendant(
      of: parentItemFinder,
      matching: find.text(month),
    );
    expect(childTextFinder, findsOneWidget);
    return childTextFinder;
  }

  Future<void> tapDropdownMenuItem(String month) async {
    final item = expectDropdownMenuItemFound(month);
    await tester.tap(item);
    await tester.pumpAndSettle();
  }

  Future<void> tapMemoTextField() async {
    final finder = find.byType(TransitionTextField<String>);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }
}
