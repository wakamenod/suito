import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_service.dart';

import 'expense_schedule_detail_view.dart';
import 'income_schedule_detail_view.dart';

class ScheduleDetailScreen extends ConsumerWidget {
  final String id;
  final int type;

  const ScheduleDetailScreen({required this.id, required this.type, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typeValue = ref.watch(typeProvider(type));

    if (TransactionType.isExpense(typeValue)) {
      return ExpenseScheduleDetailView(expenseScheduleID: id);
    } else {
      return IncomeScheduleDetailView(incomeScheduleID: id);
    }
  }
}

final typeProvider = StateProvider.family
    .autoDispose<int, int>((ref, initialValue) => initialValue);
