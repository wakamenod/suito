import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/transactions/presentations/expense/expense_detail_view.dart';

class ExpenseDetailScreen extends ConsumerWidget {
  const ExpenseDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.transactions.detail.title),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: ExpenseDetailView(),
      ),
    );
  }
}
