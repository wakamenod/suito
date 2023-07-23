import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_detail_navigator.dart';

import 'transaction/transaction_months_dropdown.dart';
import 'transaction/transactions_list.dart';
import 'transaction/transactions_total_amounts.dart';

class TransactionsScreen extends ConsumerWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = ref.watch(transactionDetailNavigatorProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.transactions.abbBar),
      ),
      body: const Column(
        children: [
          TransactionMonthsDropdown(),
          TransactionsTotalAmounts(),
          Expanded(child: TransactionsList())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigator.goNewExpense,
        backgroundColor: const Color(0xff2CAAE0),
        child: const Icon(Icons.add),
      ),
    );
  }
}
