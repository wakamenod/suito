import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/custom_autocomplete.dart';
import 'package:suito/src/common_widgets/error_message_widget.dart';
import 'package:suito/src/features/transactions/repositories/income_types_repository.dart';

// TODO 登録済みの場合の初期値対応
class IncomeTypeScreen extends ConsumerStatefulWidget {
  const IncomeTypeScreen({super.key});

  @override
  ConsumerState<IncomeTypeScreen> createState() => _IncomeTypeScreenState();
}

class _IncomeTypeScreenState extends ConsumerState<IncomeTypeScreen> {
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
        title: Text(t.transactions.incomeType.title),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop(_textEditingController.text)),
      ),
      body: Column(
        children: [
          _IncomeTypesAutocomplete(_textEditingController),
        ],
      ),
    );
  }
}

class _IncomeTypesAutocomplete extends ConsumerWidget {
  final TextEditingController controller;

  const _IncomeTypesAutocomplete(this.controller);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incomeTypesValue = ref.watch(incomeTypesListFutureProvider);

    return incomeTypesValue.when(
        data: (categoryItems) {
          return CustomAutocomplete(
            textEditingController: controller,
            items: categoryItems.map((e) => e.name),
          );
        },
        loading: () => CustomAutocomplete(
            textEditingController: controller, items: const []),
        error: (e, st) => Center(child: ErrorMessageWidget(e.toString())));
  }
}
