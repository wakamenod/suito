import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/src/features/transactions/services/transaction_service.dart';

class TransactionsTotalAmounts extends ConsumerWidget {
  const TransactionsTotalAmounts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalAmounts = ref.watch(transactionsTotalAmountsProvider);
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _SummaryCard(
              title: 'Balance',
              amount: totalAmounts.balance,
              height: 100,
              width: 150,
            ),
            Column(
              children: [
                _SummaryCard(
                  title: 'Income',
                  amount: totalAmounts.income,
                  height: 52,
                  width: 150,
                ),
                _SummaryCard(
                  title: 'Expense',
                  amount: totalAmounts.expense,
                  height: 52,
                  width: 150,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final int amount;
  final double width;
  final double height;

  const _SummaryCard(
      {required this.title,
      required this.amount,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        elevation: 0,
        color: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: const TextStyle(fontSize: 12)),
              Text('\$$amount', style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
