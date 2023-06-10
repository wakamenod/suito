import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/src/common_widgets/custom_autocomplete.dart';
import 'package:suito/src/common_widgets/error_message_widget.dart';
import 'package:suito/src/features/transactions/repositories/expense_locations_repository.dart';

class ExpenseLocationScreen extends ConsumerStatefulWidget {
  const ExpenseLocationScreen({super.key});

  @override
  ConsumerState<ExpenseLocationScreen> createState() =>
      _ExpenseLocationScreenState();
}

class _ExpenseLocationScreenState extends ConsumerState<ExpenseLocationScreen> {
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
        title: const Text('Expense Location'),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop(_textEditingController.text)),
      ),
      body: Column(
        children: [
          _ExpenseLocationsAutocomplete(_textEditingController),
        ],
      ),
    );
  }
}

class _ExpenseLocationsAutocomplete extends ConsumerWidget {
  final TextEditingController controller;

  const _ExpenseLocationsAutocomplete(this.controller);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseLocationsValue = ref.watch(expenseLocationsListFutureProvider);

    return expenseLocationsValue.when(
        data: (locationItems) {
          return CustomAutocomplete(
            textEditingController: controller,
            items: locationItems.map((e) => e.name),
          );
        },
        loading: () => CustomAutocomplete(
            textEditingController: controller, items: const []),
        error: (e, st) => Center(child: ErrorMessageWidget(e.toString())));
  }
}
