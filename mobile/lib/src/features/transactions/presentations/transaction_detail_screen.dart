import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/src/common_widgets/text_input_field.dart';
import 'package:suito/src/routing/app_router.dart';

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
              // const ExpenseCategoriesAutocomplete(),
              // const ExpenseLocationsAutocomplete(),
              _TransitionTextField(
                  hintText: "Category",
                  route: AppRoute.transactionDetailCategory),
              _TransitionTextField(
                  hintText: "Location",
                  route: AppRoute.transactionDetailLocation),
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

class _TransitionTextField extends StatelessWidget {
  final AppRoute route;
  final String hintText;
  final TextEditingController _textEditingController = TextEditingController();

  _TransitionTextField({
    required this.hintText,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color.fromRGBO(208, 208, 208, 1.0),
                width: 1.5,
              )),
          child: TextField(
            controller: _textEditingController,
            readOnly: true,
            onTap: () => context.goNamed(route.name),
            //          obscureText: obscureText,
            decoration: InputDecoration(
              labelText: 'Enter your title',
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(194, 194, 194, 1.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
