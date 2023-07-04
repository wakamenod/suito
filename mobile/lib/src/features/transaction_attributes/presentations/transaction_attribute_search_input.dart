import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/constants/app_sizes.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';

class TransactionAttributeSearchInput extends ConsumerStatefulWidget {
  const TransactionAttributeSearchInput({super.key});

  @override
  ConsumerState<TransactionAttributeSearchInput> createState() =>
      _ExpenseCategorySearchInputState();
}

class _ExpenseCategorySearchInputState
    extends ConsumerState<TransactionAttributeSearchInput> {
  late final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchStarted = ref.watch(transactionAttributeSearchControllerProvider
        .select((value) => value.searchStarted));

    return Row(
      children: [
        IconButton(
          icon: Icon(searchStarted ? Icons.arrow_back : Icons.search),
          color: const Color(0xff1D7094),
          onPressed: () {
            if (searchStarted) {
              _controller.clear();
              FocusScope.of(context).unfocus();
              ref
                  .read(transactionAttributeSearchControllerProvider.notifier)
                  .endInput();
            }
          },
        ),
        gapW8,
        Expanded(
            child: TextFormField(
          // focusNode: focusNode,
          controller: _controller,
          onTap: () {
            // _controller.clear();
            ref
                .read(transactionAttributeSearchControllerProvider.notifier)
                .startInput();
          },
          onChanged: (value) => ref
              .read(transactionAttributeSearchControllerProvider.notifier)
              .onChangeInput(value),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(bottom: 4.0),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: t.transactionAttributes.searchInputHint,
              hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[500],
                  textBaseline: TextBaseline.alphabetic)),
        )),
        if (searchStarted)
          IconButton(
            icon: const Icon(Icons.clear),
            color: const Color(0xff1D7094),
            onPressed: () {
              _controller.clear();
              ref
                  .read(transactionAttributeSearchControllerProvider.notifier)
                  .clearInput();
            },
          )
      ],
    );
  }
}
