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
import 'package:suito/src/routing/app_router.dart';

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
                  onPressed: () {
                    final record = ref.read(transactionAttributeIDProvider);
                    context.pop(AttributeEntry(record.id, record.name));
                  },
                ),
                actions: [
                  IconButton(
                      icon: const Icon(Icons.settings, color: Colors.white),
                      onPressed: () =>
                          context.pushNamed(AppRoute.attributeSettings.path))
                ],
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
                  TransactionAttributeBottomSheet
                      .showTransactionAttributeBottomSheet(context);
                },
                backgroundColor: const Color(0xff2CAAE0),
                label: Text(t.transactionAttributes.floatingButton),
                icon: const Icon(Icons.add),
              ),
      ),
    );
  }
}
