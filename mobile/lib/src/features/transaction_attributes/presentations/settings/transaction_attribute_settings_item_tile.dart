import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/transaction_attributes/presentations/settings/transaction_attribute_settings_delete_dialog.dart';
import 'package:suito/src/features/transaction_attributes/presentations/transaction_attribute_bottom_sheet.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';

enum _PopupItemType { rename, delete }

class TransactionAttributeSettingsItemTile extends ConsumerWidget {
  final AttributeEntry entry;

  const TransactionAttributeSettingsItemTile({super.key, required this.entry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[500]!, width: 0.5),
          borderRadius: BorderRadius.circular(3),
        ),
        child: ListTile(
          title: Text(
            entry.name,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          trailing: PopupMenuButton<_PopupItemType>(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).colorScheme.secondary,
            ),
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<_PopupItemType>>[
              PopupMenuItem<_PopupItemType>(
                value: _PopupItemType.rename,
                child: Text(t.transactionAttributes.settingsRename),
              ),
              PopupMenuItem<_PopupItemType>(
                value: _PopupItemType.delete,
                child: Text(t.transactionAttributes.settingsDelete),
              ),
            ],
            onSelected: (_PopupItemType type) {
              switch (type) {
                case _PopupItemType.rename:
                  TransactionAttributeBottomSheet
                      .showTransactionAttributeBottomSheet(context, ref,
                          initialName: entry.name, onSubmit: () {
                    return ref
                        .read(transactionAttributeSubmitControllerProvider
                            .notifier)
                        .update(entry.id);
                  });
                case _PopupItemType.delete:
                  showDialog(
                    context: context, // use this context to show dialog
                    builder: (context) {
                      return TransactionAttributeSettingsDeleteDialog(
                        entry: entry,
                      );
                    },
                  );
              }
            },
          ),
        ));
  }
}
