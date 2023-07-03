import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/constants/app_sizes.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_detail_selection_service.dart';

class ExpenseCategorySearchInput extends ConsumerStatefulWidget {
  const ExpenseCategorySearchInput({super.key});

  @override
  ConsumerState<ExpenseCategorySearchInput> createState() =>
      _ExpenseCategorySearchInputState();
}

class _ExpenseCategorySearchInputState
    extends ConsumerState<ExpenseCategorySearchInput> {
  late final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchStarted = ref.watch(transactionDetailSelectionControllerProvider
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
                  .read(transactionDetailSelectionControllerProvider.notifier)
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
                .read(transactionDetailSelectionControllerProvider.notifier)
                .startInput();
          },
          onChanged: (value) => ref
              .read(transactionDetailSelectionControllerProvider.notifier)
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
                  .read(transactionDetailSelectionControllerProvider.notifier)
                  .clearInput();
            },
          )
      ],
    );
  }
}
