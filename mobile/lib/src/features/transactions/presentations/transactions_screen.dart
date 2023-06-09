import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/routing/shell_screen.dart';

import 'transaction_months_dropdown.dart';
import 'transactions_list.dart';
import 'transactions_total_amounts.dart';

class TransactionsScreen extends ConsumerWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: const Column(
        children: [
          TransactionMonthsDropdown(),
          TransactionsTotalAmounts(),
          Expanded(child: TransactionsList())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go(
              "${NavigationBarRoute.transactions.path}/${AppRoute.transactionDetail.path}");
          // showDialog(
          //     context: context,
          //     builder: (BuildContext context) {
          //       return const TransactionEditDialog();
          //     });
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
