import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/features/transactions/presentations/expense/expense_category_search_input.dart';
import 'package:suito/src/features/transactions/presentations/expense/expense_filtered_category_list.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_detail_selection_service.dart';

import 'add_new_category_tile.dart';
import 'new_category_bottom_sheet.dart';

class NewExpenseCategoryScreen extends ConsumerWidget {
  const NewExpenseCategoryScreen({required this.selectedValue, super.key});

  final String selectedValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchStarted = ref.watch(transactionDetailSelectionControllerProvider
        .select((value) => value.searchStarted));

    return SafeArea(
      top: searchStarted,
      child: Scaffold(
        appBar: searchStarted
            ? null
            : AppBar(
                title: Text(t.transactions.incomeType.title),
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => context.pop(selectedValue)),
              ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const ExpenseCategorySearchInput(),
            const Divider(
              height: 0,
            ),
            const AddNewCategoryTile(),
            Expanded(
              child: ExpenseFilteredCategoryList(
                selectedValue: selectedValue,
              ),
            ),
          ],
        ),
        floatingActionButton: searchStarted
            ? null
            : FloatingActionButton.extended(
                onPressed: () {
                  showModalBottomSheet<String?>(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(12))),
                    builder: (context) {
                      return const NewCategoryBottomSheet();
                    },
                  ).then((result) {
                    if (result != null) {
                      context.pop(result);
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
