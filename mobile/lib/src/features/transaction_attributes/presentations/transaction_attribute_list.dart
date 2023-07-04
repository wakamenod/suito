import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_entry.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';

class TransactionAttributeList extends ConsumerWidget {
  const TransactionAttributeList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredCategoriesValue = ref.watch(filteredCategoriesProvider);

    return AsyncValueWidget<
        ({List<AttributeEntry> filteredItems, AttributeEntry selected})>(
      value: filteredCategoriesValue,
      data: (value) => SingleChildScrollView(
        child: ListBody(
            children: value.filteredItems
                .map(
                  (category) => RadioListTile<AttributeEntry>(
                    title: Text(category.name),
                    value: category,
                    groupValue: value.selected,
                    onChanged: (AttributeEntry? value) {
                      context.pop(value?.id ?? '');
                    },
                  ),
                )
                .toList()),
      ),
    );
  }
}
