import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_service.dart';
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/utils/currency_formatter.dart';

class TransactionsListItem extends ConsumerWidget {
  TransactionsListItem({super.key, required this.transaction});

  final Transaction transaction;
  final _dateFormatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyFormatter = ref.watch(currencyFormatterProvider);

    return GestureDetector(
      onTap: () {
        context.goNamed(AppRoute.transactionDetail.name, queryParameters: {
          'id': transaction.id,
          'type': transaction.type.toString()
        });
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: SizedBox(
          height: 55,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          transaction.title,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              currencyFormatter.format(transaction.amount),
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: TransactionType.isExpense(
                                          transaction.type)
                                      ? Colors.red
                                      : Colors.green)),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                        child: Icon(Icons.more_vert),
                      ),
                    ]),
                Row(children: [
                  Text(
                    _dateFormatter.format(DateTime.parse(
                      transaction.localDate,
                    )),
                    style: const TextStyle(fontSize: 10),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
