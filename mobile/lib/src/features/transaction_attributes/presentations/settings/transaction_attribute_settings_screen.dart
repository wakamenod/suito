import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/constants/app_sizes.dart';
import 'package:suito/src/features/transaction_attributes/presentations/transaction_attribute_bottom_sheet.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';

class TransactionAttributeSettingsScreen extends ConsumerWidget {
  const TransactionAttributeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final words = ref.watch(transactionAttributeWordsProvider);
    final attributesValue = ref.watch(listAttributeEntriesProvider);

    return AsyncValueWidget<List<AttributeEntry>>(
      value: attributesValue,
      data: (attributes) => Scaffold(
        appBar: AppBar(
          title: Text(
              t.transactionAttributes.appBarSettings(title: words.appBar())),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListBody(
              children: [
                gapH12,
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500]!, width: 0.5),
                    borderRadius: BorderRadius.circular(3),
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
                gapH12,
                Row(
                  children: [
                    Text(
                      words.settingsListLabel(),
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                ),
                gapH8,
                ...attributes
                    .map((a) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey[500]!, width: 0.5),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: ListTile(
                                title: Text(
                                  a.name,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                                trailing: Icon(
                                  Icons.more_vert,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                onTap: () {
                                  // TransactionAttributeBottomSheet
                                  //     .showTransactionAttributeBottomSheet(context);
                                },
                              )),
                        ))
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
