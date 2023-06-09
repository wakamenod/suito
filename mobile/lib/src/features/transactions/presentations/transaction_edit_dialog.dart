import 'package:flutter/material.dart';
import 'package:suito/src/common_widgets/text_input_field.dart';

import 'expense_categories_autocomplete.dart';
import 'expense_locations_autocomplete.dart';

class TransactionEditDialog extends StatelessWidget {
  const TransactionEditDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: SizedBox(
        height: 400,
        child: SingleChildScrollView(
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
              const Text(
                "This is a Custom Dialog",
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"))
            ],
          ),
        ),
      ),
    );
  }
}
