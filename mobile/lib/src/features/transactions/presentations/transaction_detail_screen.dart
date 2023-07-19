import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/transactions/presentations/expense/expense_detail_view.dart';
import 'package:suito/src/features/transactions/presentations/incomes/income_detail_view.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_service.dart';

class TransactionDetailScreen extends ConsumerWidget {
  final String? id;
  final int type;

  const TransactionDetailScreen(
      {required this.id, required this.type, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typeValue = ref.watch(typeProvider(type));

    return Scaffold(
      appBar: AppBar(
        title: Text(t.transactions.detail.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: TransactionType.isExpense(typeValue)
            ? ExpenseDetailView(expenseID: id)
            : IncomeDetailView(incomeID: id),
      ),
    );
  }
}

final typeProvider = StateProvider.family
    .autoDispose<int, int>((ref, initialValue) => initialValue);
