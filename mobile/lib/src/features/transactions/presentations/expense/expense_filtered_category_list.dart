import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_detail_selection_service.dart';

class ExpenseFilteredCategoryList extends ConsumerWidget {
  const ExpenseFilteredCategoryList({required this.selectedValue, super.key});

  final String selectedValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredCategoriesValue =
        ref.watch(filteredCategoriesProvider(selectedValue));

    return AsyncValueWidget<
        ({
          List<ModelExpenseCategory> filteredItems,
          ModelExpenseCategory selected
        })>(
      value: filteredCategoriesValue,
      data: (value) => SingleChildScrollView(
        child: ListBody(
            children: value.filteredItems
                .map(
                  (category) => RadioListTile<ModelExpenseCategory>(
                    title: Text(category.name),
                    value: category,
                    groupValue: value.selected,
                    onChanged: (ModelExpenseCategory? value) {
                      context.pop(value?.id == null ? '' : value?.name);
                    },
                  ),
                )
                .toList()),
      ),
    );
  }
}
