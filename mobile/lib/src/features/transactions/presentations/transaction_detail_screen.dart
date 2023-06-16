import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/src/features/transactions/presentations/expense_detail_view.dart';
import 'package:suito/src/features/transactions/services/transaction_service.dart';

import 'income_detail_view.dart';

class TransactionDetailScreen extends ConsumerWidget {
  final String id;
  final int type;

  const TransactionDetailScreen(
      {required this.id, required this.type, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typeValue = ref.watch(typeProvider(type));

    if (TransactionType.isExpense(typeValue)) {
      return ExpenseDetailView(expenseID: id);
    } else {
      return IncomeDetailView(incomeID: id);
    }
  }
}

final typeProvider = StateProvider.family
    .autoDispose<int, int>((ref, initialValue) => initialValue);
