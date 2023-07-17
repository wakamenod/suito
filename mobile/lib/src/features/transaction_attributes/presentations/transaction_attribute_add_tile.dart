import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/features/transaction_attributes/presentations/transaction_attribute_bottom_sheet.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';

class TransactionAttributeAddTile extends ConsumerWidget {
  const TransactionAttributeAddTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unregisteredInputValue = ref.watch(addableInputValueProvider);

    return AsyncValueWidget<String?>(
      value: unregisteredInputValue,
      data: (inputValue) => Visibility(
        visible: inputValue != null,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey, width: 0.5),
            ),
          ),
          child: ListTile(
            title: Text(
                t.transactionAttributes.addTile.title(input: inputValue ?? '')),
            subtitle: Text(
              t.transactionAttributes.addTile.subtitle,
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
            leading: const Icon(
              Icons.library_add,
              color: Color(0xff1D7094),
            ),
            onTap: () {
              showModalBottomSheet<AttributeEntry?>(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12))),
                builder: (context) {
                  return const TransactionAttributeBottomSheet();
                },
              ).then((result) {
                if (result != null) {
                  context.pop(result);
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
