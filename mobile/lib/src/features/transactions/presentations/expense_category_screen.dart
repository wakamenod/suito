import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/custom_autocomplete.dart';
import 'package:suito/src/common_widgets/error_message_widget.dart';
import 'package:suito/src/features/transactions/repositories/expense_categories_repository.dart';

class ExpenseCategoryScreen extends ConsumerStatefulWidget {
  const ExpenseCategoryScreen({super.key});

  @override
  ConsumerState<ExpenseCategoryScreen> createState() =>
      _ExpenseCategoryScreenState();
}

class _ExpenseCategoryScreenState extends ConsumerState<ExpenseCategoryScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.transactions.category.title),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop(_textEditingController.text)),
      ),
      body: Column(
        children: [
          _ExpenseCategoriesAutocomplete(_textEditingController),
        ],
      ),
    );
  }
}

class _ExpenseCategoriesAutocomplete extends ConsumerWidget {
  final TextEditingController controller;

  const _ExpenseCategoriesAutocomplete(this.controller);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseCategoriesValue =
        ref.watch(expenseCategoriesListFutureProvider);

    return expenseCategoriesValue.when(
        data: (categoryItems) {
          return CustomAutocomplete(
            textEditingController: controller,
            items: categoryItems.map((e) => e.name),
          );
        },
        loading: () => CustomAutocomplete(
            textEditingController: controller, items: const []),
        error: (e, st) => Center(child: ErrorMessageWidget(e.toString())));
  }
}
