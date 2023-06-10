import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseMemoScreen extends ConsumerWidget {
  const ExpenseMemoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Memo'),
      ),
      body: const Column(
        children: [
          TextField(
            maxLines: null,
            minLines: 5,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'ここにメモを入力してください...',
            ),
          ),
        ],
      ),
    );
  }
}
