import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/src/common_widgets/custom_autocomplete.dart';
import 'package:suito/src/common_widgets/error_message_widget.dart';
import 'package:suito/src/features/transactions/repositories/expense_locations_repository.dart';

class ExpenseLocationScreen extends ConsumerWidget {
  const ExpenseLocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Location'),
      ),
      body: const Column(
        children: [
          _ExpenseLocationsAutocomplete(),
        ],
      ),
    );
  }
}

class _ExpenseLocationsAutocomplete extends ConsumerWidget {
  const _ExpenseLocationsAutocomplete();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseLocationsValue = ref.watch(expenseLocationsListFutureProvider);

    return expenseLocationsValue.when(
        data: (locationItems) {
          return CustomAutocomplete(
            items: locationItems.map((e) => e.name),
          );
        },
        loading: () => CustomAutocomplete(items: const []),
        error: (e, st) => Center(child: ErrorMessageWidget(e.toString())));
  }
}
