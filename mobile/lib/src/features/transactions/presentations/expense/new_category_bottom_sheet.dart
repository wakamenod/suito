import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/constants/app_sizes.dart';
import 'package:suito/src/features/transaction_attributes/services/transaction_attribute_service.dart';

class NewCategoryBottomSheet extends ConsumerWidget {
  const NewCategoryBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(transactionAttributeControllerProvider);

    return SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.close, size: 24),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).pop(null);
                  },
                ),
                Text(
                  t.transactionAttributes.bottomSheet.title,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              height: 0,
            ),
            gapH24,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Center(
                child: TextFormField(
                  initialValue: name.value,
                  onChanged: ref
                      .read(transactionAttributeControllerProvider.notifier)
                      .onChangeName,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: t.transactionAttributes.bottomSheet.inputLabel,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                  ),
                ),
              ),
            ),
            gapH24,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    backgroundColor: const Color(0xff1D7094),
                  ),
                  onPressed: () async {
                    final navigatorState = Navigator.of(context);
                    await ref
                        .read(transactionAttributeControllerProvider.notifier)
                        .submit();
                    navigatorState.pop(
                        ref.read(transactionAttributeControllerProvider).value);
                  },
                  child: Text(
                    t.transactions.buttons.post,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}