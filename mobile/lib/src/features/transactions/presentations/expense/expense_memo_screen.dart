import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/app.dart';
import 'package:suito/src/features/transactions/services/expense/expense_form_controller.dart';
import 'package:suito/src/routing/app_router.dart';

class ExpenseMemoScreen extends ConsumerStatefulWidget {
  const ExpenseMemoScreen({super.key});

  @override
  ConsumerState<ExpenseMemoScreen> createState() => _ExpenseMemoScreenState();
}

class _ExpenseMemoScreenState extends ConsumerState<ExpenseMemoScreen> {
  late final TextEditingController _textEditingController =
      TextEditingController(
          text: ref.watch(
              expenseFormControllerProvider.select((value) => value.memo)));

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => ref
                .read(goRouterProvider(navigatorKey))
                .pop(_textEditingController.text)),
        title: Text(t.transactions.memo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _textEditingController,
          maxLines: null,
          minLines: 5,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: t.transactions.memo.hintText,
            fillColor: Colors.white70,
            filled: true,
          ),
        ),
      ),
    );
  }
}
