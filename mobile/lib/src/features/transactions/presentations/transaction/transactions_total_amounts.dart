import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_service.dart';
import 'package:suito/src/utils/currency_formatter.dart';

class TransactionsTotalAmounts extends ConsumerWidget {
  const TransactionsTotalAmounts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalAmounts = ref.watch(transactionsTotalAmountsProvider);
    final currencyFormatter = ref.watch(currencyFormatterProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        color: Colors.white,
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    t.transactions.totalAmounts.balance,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  Text(
                    currencyFormatter.format(totalAmounts.balance),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    t.transactions.totalAmounts.income,
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  Text(
                    currencyFormatter.format(totalAmounts.income),
                    style: const TextStyle(fontSize: 15.0, color: Colors.green),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    t.transactions.totalAmounts.expense,
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  Text(
                    currencyFormatter.format(totalAmounts.expense),
                    style: const TextStyle(fontSize: 15.0, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
