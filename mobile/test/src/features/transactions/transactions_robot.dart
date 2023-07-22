import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suito/src/app_theme.dart';
import 'package:suito/src/features/transactions/presentations/transaction/transactions_list_empty_label.dart';
import 'package:suito/src/features/transactions/presentations/transaction_detail_screen.dart';
import 'package:suito/src/features/transactions/presentations/transactions_screen.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_categories_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_detail_repository.dart';
import 'package:suito/src/features/transactions/repositories/expense/expense_locations_repository.dart';
import 'package:suito/src/features/transactions/repositories/transaction/transaction_months_repository.dart';
import 'package:suito/src/features/transactions/repositories/transaction/transactions_repository.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_service.dart';
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
  }

  Future<void> pumpExpenseDetailScreen(
      {ExpenseDetailRepository? expenseRepo,
      ExpenseCategoriesRepository? categoryRepo,
      ExpenseLocationsRepository? locationRepo,
      required String? id,
      required DateTime now}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          currentTimeProvider.overrideWithValue(now),
          if (expenseRepo != null)
            expenseDetailRepositoryProvider.overrideWithValue(expenseRepo),
          if (categoryRepo != null)
            expenseCategoriesRepositoryProvider.overrideWithValue(
              categoryRepo,
            ),
          if (locationRepo != null)
            expenseLocationsRepositoryProvider.overrideWithValue(
              locationRepo,
            )
        ],
        child: MaterialApp(
            home: TransactionDetailScreen(
              id: id,
              type: TransactionType.expense.value,
            ),
            theme: AppTheme().create()),
      ),
    );
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
}
