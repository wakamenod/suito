import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/src/app_theme.dart';
import 'package:suito/src/features/transactions/presentations/expense/expense_memo_screen.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_controller.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_value.dart';
import 'package:suito/src/routing/app_router.dart';

class MemoRobot {
  MemoRobot(this.tester);
  final WidgetTester tester;

  Future<void> pumpMemoScreen(ExpenseFormValue value,
      {GoRouter? router}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          expenseFormInitialValueProvider.overrideWith((ref) => value),
          if (router != null)
            goRouterProvider.overrideWith((ref, arg) => router),
        ],
        child: MaterialApp(
            home: const ExpenseMemoScreen(), theme: AppTheme().create()),
      ),
    );
    await tester.pumpAndSettle();
  }

  void expectMemoFieldFound() {
    final memoField = find.byType(TextField);
    expect(memoField, findsOneWidget);
  }

  Future<void> enterMemo(String memo) async {
    final memoField = find.byType(TextField);
    expect(memoField, findsOneWidget);
    await tester.enterText(memoField, memo);
    await tester.pump();
  }

  Future<void> tapBackButton() async {
    final backButton = find.byIcon(Icons.arrow_back);
    expect(backButton, findsOneWidget);
    await tester.tap(backButton);
    await tester.pump();
  }
}
