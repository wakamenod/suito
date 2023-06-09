import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          return _ExpenseCategoriesAutocomplete(
            categoryItems: categoryItems.map((e) => e.name),
          );
        },
        loading: () => _ExpenseCategoriesAutocomplete(categoryItems: const []),
        error: (e, st) => Center(child: ErrorMessageWidget(e.toString())));
  }
}

class _ExpenseCategoriesAutocomplete extends StatelessWidget {
  final Iterable<String> categoryItems;
  final TextEditingController textEditingController = TextEditingController();

  _ExpenseCategoriesAutocomplete({required this.categoryItems});

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return categoryItems;
        }
        return categoryItems.where(
            (option) => option.contains(textEditingValue.text.toLowerCase()));
      },
      onSelected: (String selection) {
        debugPrint('Selected $selection');
      },
    );
  }
}
