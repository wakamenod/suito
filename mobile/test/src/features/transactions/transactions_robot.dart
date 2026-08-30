import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/app_theme.dart';
import 'package:suito/src/common_widgets/transition_text_field.dart';
import 'package:suito/src/features/transactions/presentations/expense/expense_detail_screen.dart';
import 'package:suito/src/features/transactions/presentations/incomes/income_detail_screen.dart';
import 'package:suito/src/features/transactions/presentations/transaction/transactions_list.dart';
import 'package:suito/src/features/transactions/presentations/transaction/transactions_list_empty_label.dart';
import 'package:suito/src/features/transactions/presentations/transactions_screen.dart';
import 'package:suito/src/features/transactions/repositories/expense/delete_expense_repository.dart';
import 'package:suito/src/features/transactions/repositories/income/delete_income_repository.dart';
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
      DeleteExpenseRepository? deleteExpenseRepo,
      DeleteIncomeRepository? deleteIncomeRepo,
      required DateTime now}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          currentTimeProvider.overrideWithValue(now),
          if (transactionsRepo != null)
            transactionsRepositoryProvider.overrideWithValue(transactionsRepo),
          if (monthsRepo != null)
            transactionMonthsRepositoryProvider.overrideWithValue(monthsRepo),
          if (deleteExpenseRepo != null)
            deleteExpenseRepositoryProvider
                .overrideWithValue(deleteExpenseRepo),
          if (deleteIncomeRepo != null)
            deleteIncomeRepositoryProvider.overrideWithValue(deleteIncomeRepo),
        ],
        child: MaterialApp(
            home: const TransactionsScreen(), theme: AppTheme().create()),
      ),
    );
    await tester.pumpAndSettle();
  }

  /// Pumps just the list, without the month dropdown and totals header. Keeps
  /// swipe tests off `dropdown_button2`, which overflows the test surface.
  Future<void> pumpTransactionsListOnly(
      {required TransactionsRepository transactionsRepo,
      DeleteExpenseRepository? deleteExpenseRepo,
      DeleteIncomeRepository? deleteIncomeRepo,
      required DateTime now}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          currentTimeProvider.overrideWithValue(now),
          transactionsRepositoryProvider.overrideWithValue(transactionsRepo),
          if (deleteExpenseRepo != null)
            deleteExpenseRepositoryProvider
                .overrideWithValue(deleteExpenseRepo),
          if (deleteIncomeRepo != null)
            deleteIncomeRepositoryProvider.overrideWithValue(deleteIncomeRepo),
        ],
        child: MaterialApp(
            home: const Scaffold(body: TransactionsList()),
            theme: AppTheme().create()),
      ),
    );
    await tester.pumpAndSettle();
  }

  /// Swipes the row titled [title] right-to-left and confirms the dialog, which
  /// is what actually fires `onDismissed`.
  Future<void> swipeToDelete(String title) async {
    // Past Dismissible's 0.4-of-width threshold, whatever the test surface is.
    await tester.fling(find.text(title), const Offset(-1200, 0), 2000);
    await tester.pumpAndSettle();
    await tester.tap(find.text(t.general.dismissible.buttonDelete));
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
