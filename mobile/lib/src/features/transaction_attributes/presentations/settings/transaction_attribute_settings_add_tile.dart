import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/src/features/transaction_attributes/presentations/transaction_attribute_bottom_sheet.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';

class TransactionAttributeSettingsAddTile extends ConsumerWidget {
  const TransactionAttributeSettingsAddTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final words = ref.watch(transactionAttributeWordsProvider);

    return Container(
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
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        onTap: () {
          TransactionAttributeBottomSheet.showTransactionAttributeBottomSheet(
              context, ref,
              initialName: '',
              onSubmit: ref
                  .read(transactionAttributeSubmitControllerProvider.notifier)
                  .register);
        },
      ),
    );
  }
}
