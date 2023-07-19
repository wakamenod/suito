import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/constants/app_sizes.dart';
import 'package:suito/src/features/transaction_attributes/presentations/settings/transaction_attribute_settings_add_tile.dart';
import 'package:suito/src/features/transaction_attributes/presentations/settings/transaction_attribute_settings_item_tile.dart';
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
                const TransactionAttributeSettingsAddTile(),
                gapH12,
                Row(
                  children: [
                    Text(
                      words.settingsListLabel(),
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                ),
                gapH4,
                ...attributes
                    .where((element) => element.id != null)
                    .map((a) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TransactionAttributeSettingsItemTile(entry: a),
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
