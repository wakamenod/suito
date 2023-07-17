import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/transaction_attributes/presentations/transaction_attribute_add_tile.dart';
import 'package:suito/src/features/transaction_attributes/presentations/transaction_attribute_bottom_sheet.dart';
import 'package:suito/src/features/transaction_attributes/presentations/transaction_attribute_list.dart';
import 'package:suito/src/features/transaction_attributes/presentations/transaction_attribute_search_input.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';

class TransactionAttributeSelectScreen extends ConsumerWidget {
  const TransactionAttributeSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchStarted = ref.watch(transactionAttributeSearchControllerProvider
        .select((value) => value.searchStarted));
    final words = ref.watch(transactionAttributeWordsProvider);

    return SafeArea(
      top: searchStarted,
      child: Scaffold(
        appBar: searchStarted
            ? null
            : AppBar(
                title: Text(words.appBar()),
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () =>
                        context.pop(ref.read(transactionAttributeIDProvider))),
              ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TransactionAttributeSearchInput(),
            Divider(
              height: 0,
            ),
            TransactionAttributeAddTile(),
            Expanded(
              child: TransactionAttributeList(),
            ),
          ],
        ),
        floatingActionButton: searchStarted
            ? null
            : FloatingActionButton.extended(
                onPressed: () {
                  showModalBottomSheet<AttributeEntry?>(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(12))),
                    builder: (context) {
                      return const TransactionAttributeBottomSheet();
                    },
                  ).then((AttributeEntry? result) {
                    if (result != null) {
                      context.pop<AttributeEntry>(result);
                    }
                  });
                },
                backgroundColor: const Color(0xff2CAAE0),
                label: Text(t.transactionAttributes.floatingButton),
                icon: const Icon(Icons.add),
              ),
      ),
    );
  }
}
