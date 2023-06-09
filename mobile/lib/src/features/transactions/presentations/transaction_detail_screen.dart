import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionDetailScreen extends ConsumerWidget {
  const TransactionDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransactionDetail'),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
