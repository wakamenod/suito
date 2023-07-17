import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/constants/app_sizes.dart';
import 'package:suito/src/features/transaction_attributes/presentations/transaction_attribute_bottom_sheet.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';

class TransactionAttributeSettingsScreen extends ConsumerWidget {
  const TransactionAttributeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final words = ref.watch(transactionAttributeWordsProvider);

    return Scaffold(
      appBar: AppBar(
        title:
            Text(t.transactionAttributes.appBarSettings(title: words.appBar())),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListBody(
            children: [
              gapH12,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[500]!),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  title: Text(
                    words.settingsAddTile(),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  onTap: () {
                    TransactionAttributeBottomSheet
                        .showTransactionAttributeBottomSheet(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
