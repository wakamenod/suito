import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/src/common_widgets/text_input_field.dart';

import 'expense_categories_autocomplete.dart';
import 'expense_locations_autocomplete.dart';

class TransactionDetailScreen extends ConsumerWidget {
  const TransactionDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TransactionDetail'),
        ),
        body: SingleChildScrollView(
          child: ListBody(
            children: [
              TextInputField(
                  errorText: "Error",
                  hintText: "Title",
                  onChanged: (value) => {}),
              TextInputField(
                  errorText: "Error",
                  hintText: "Amount",
                  inputType: InputType.digits,
                  onChanged: (value) => {}),
              TextInputField(
                  hintText: "Date",
                  inputType: InputType.date,
                  onChanged: (value) => {}),
              const ExpenseCategoriesAutocomplete(),
              const ExpenseLocationsAutocomplete(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"))
            ],
          ),
        ));
  }
}
