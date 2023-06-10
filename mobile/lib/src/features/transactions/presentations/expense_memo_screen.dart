import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ExpenseMemoScreen extends ConsumerStatefulWidget {
  const ExpenseMemoScreen({super.key});

  @override
  ConsumerState<ExpenseMemoScreen> createState() => _ExpenseMemoScreenState();
}

class _ExpenseMemoScreenState extends ConsumerState<ExpenseMemoScreen> {
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
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop(_textEditingController.text)),
        title: const Text('Expense Memo'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            maxLines: null,
            minLines: 5,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'ここにメモを入力してください...',
            ),
          ),
        ],
      ),
    );
  }
}
