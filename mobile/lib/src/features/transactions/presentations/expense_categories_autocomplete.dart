import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/src/common_widgets/custom_autocomplete.dart';
import 'package:suito/src/common_widgets/error_message_widget.dart';
import 'package:suito/src/features/transactions/repositories/expense_categories_repository.dart';

class ExpenseCategoriesAutocomplete extends ConsumerWidget {
  const ExpenseCategoriesAutocomplete({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseCategoriesValue =
        ref.watch(expenseCategoriesListFutureProvider);

    return expenseCategoriesValue.when(
        data: (categoryItems) {
          return CustomAutocomplete(
            categoryItems: categoryItems.map((e) => e.name),
          );
        },
        loading: () => CustomAutocomplete(categoryItems: const []),
        error: (e, st) => Center(child: ErrorMessageWidget(e.toString())));
  }
}
