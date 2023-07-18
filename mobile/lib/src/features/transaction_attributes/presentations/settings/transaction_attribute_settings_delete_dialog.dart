import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/constants/app_sizes.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';

class TransactionAttributeSettingsDeleteDialog extends ConsumerWidget {
  final AttributeEntry entry;

  const TransactionAttributeSettingsDeleteDialog(
      {super.key, required this.entry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final words = ref.watch(transactionAttributeWordsProvider);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      title: Text(
        words.deleteConfirmTitle(),
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(t.transactionAttributes.deleteConfirmation),
          gapH20,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 5.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Expanded(
                child: Text(words.deleteConfirmContent()),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        Row(children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 1),
                  elevation: 0),
              child: Text(t.transactionAttributes.settingsCancel,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  )),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          gapW12,
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.error,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  elevation: 0),
              child: Text(t.transactionAttributes.settingsDelete),
              onPressed: () {
                ref
                    .watch(transactionAttributeRepositoryProvider)
                    .delete(entry.id!);
                context.pop();
              },
            ),
          ),
        ]),
      ],
    );
  }
}
