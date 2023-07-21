import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suito/src/app_theme.dart';
import 'package:suito/src/features/transactions/presentations/transaction/transactions_list_empty_label.dart';
import 'package:suito/src/features/transactions/presentations/transactions_screen.dart';
import 'package:suito/src/features/transactions/repositories/transaction/transaction_months_repository.dart';
import 'package:suito/src/features/transactions/repositories/transaction/transactions_repository.dart';

class TransactionsRobot {
  TransactionsRobot(this.tester);
  final WidgetTester tester;

  Future<void> pumpTransactionsScreen(
      {TransactionsRepository? transactionsRepo,
      TransactionMonthsRepository? monthsRepo}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
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

  void expectEmptyLabelFound() {
    expect(find.byType(TransactionsListEmptyLabel), findsOneWidget);
  }
}
