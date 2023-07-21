import 'package:flutter/material.dart';
import 'package:suito/i18n/translations.g.dart';

class TransactionsListEmptyLabel extends StatelessWidget {
  const TransactionsListEmptyLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.info_outline,
          color: Colors.blue[200],
          size: 50.0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            t.transactions.emptyLabel,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ));
  }
}
