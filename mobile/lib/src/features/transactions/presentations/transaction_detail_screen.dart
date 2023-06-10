import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/src/common_widgets/text_input_field.dart';
import 'package:suito/src/features/transactions/services/expense_service.dart';
import 'package:suito/src/routing/app_router.dart';

class TransactionDetailScreen extends ConsumerWidget {
  const TransactionDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseController = ref.watch(expenseControllerProvider.notifier);

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
                  onChanged: expenseController.onChangeTitle),
              TextInputField(
                  errorText: "Error",
                  hintText: "Amount",
                  inputType: InputType.digits,
                  onChanged: (val) =>
                      expenseController.onChangeAmount(int.tryParse(val) ?? 0)),
              TextInputField(
                  hintText: "Date",
                  inputType: InputType.date,
                  onChanged: expenseController.onChangeDate),
              _TransitionTextField(
                  hintText: "Category",
                  labelText: "Category",
                  route: AppRoute.transactionDetailCategory,
                  onChanged: expenseController.onChangeCategory),
              _TransitionTextField(
                  hintText: "Location",
                  labelText: "Location",
                  route: AppRoute.transactionDetailLocation,
                  onChanged: expenseController.onChangeLocation),
              _TransitionTextField(
                  hintText: "Memo",
                  labelText: "Memo",
                  route: AppRoute.transactionDetailMemo,
                  onChanged: expenseController.onChangeMemo),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close")),
              ElevatedButton(
                onPressed: () {
                  expenseController.registerExpense();
                },
                child: const Text(
                  "Post",
                ),
              )
            ],
          ),
        ));
  }
}

class _TransitionTextField extends StatefulWidget {
  final AppRoute route;
  final String hintText;
  final String labelText;
  final ValueChanged<String> onChanged;

  const _TransitionTextField({
    required this.hintText,
    required this.route,
    required this.labelText,
    required this.onChanged,
  });

  @override
  State<_TransitionTextField> createState() => _TransitionTextFieldState();
}

class _TransitionTextFieldState extends State<_TransitionTextField> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

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
            onTap: () async {
              final val =
                  await context.pushNamed<String>(widget.route.name) ?? '';
              _textEditingController.text = val;
              widget.onChanged(val);
            },
            //          obscureText: obscureText,
            decoration: InputDecoration(
              labelText: widget.labelText,
              border: InputBorder.none,
              hintText: widget.hintText,
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
