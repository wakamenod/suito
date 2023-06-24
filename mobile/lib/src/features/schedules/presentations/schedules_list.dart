import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/features/schedules/services/schedule_service.dart';
import 'package:suito/src/features/transactions/services/transaction_service.dart';
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/utils/currency_formatter.dart';

class SchedulesList extends ConsumerWidget {
  const SchedulesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedulesValue = ref.watch(fetchSchedulesProvider);
    final currencyFormatter = ref.watch(currencyFormatterProvider);

    return AsyncValueWidget<List<Schedules>>(
      value: schedulesValue,
      data: (schedules) => ListView.builder(
        itemCount: schedules.length,
        itemBuilder: (_, index) => // ExpansionTile(
            // initiallyExpanded: true,
            // title: Row(
            //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(schedules[index].header),
            //     IconButton(
            //       icon: const Icon(Icons.add_circle),
            //       onPressed: () {
            //         // ここで追加ボタンが押されたときの処理を書く
            //         print('Add button pressed');
            //       },
            //     ),
            //   ],
            // ),
            Column(
          children: <Widget>[
            ListTile(
              title: Row(
                children: [
                  Text(schedules[index].headerText),
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    onPressed: () {
                      // Add button pressed
                      context.goNamed(AppRoute.scheduleDetail.name,
                          queryParameters: {
                            'id': '',
                            'type': index == 0
                                ? TransactionType.expense.value.toString()
                                : TransactionType.income.value.toString()
                          });
                    },
                  ),
                ],
              ),
            ),
            ...schedules[index]
                .items
                .map<Widget>(
                  (item) => Dismissible(
                    key: Key(item.id),
                    onDismissed: (direction) async {
                      final ScaffoldMessengerState state =
                          ScaffoldMessenger.of(context);

                      // await ref
                      //     .read(deleteExpenseControllerProvider.notifier)
                      //     .deleteExpense(schedule.id);

                      // Show a snackbar.
                      state.showSnackBar(SnackBar(
                          content: Text(t.general.dismissible.snackBar)));
                    },
                    confirmDismiss: (direction) async {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(t.general.dismissible.confirmContent),
                            content: Text(t.general.dismissible.confirmContent),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: Text(t.general.dismissible.buttonDelete),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: Text(t.general.dismissible.buttonCancel),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            const Icon(Icons.delete, color: Colors.white),
                            Text(t.general.dismissible.backgroundText,
                                style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                    child: SizedBox(
                      height: 50,
                      child: GestureDetector(
                          onTap: () {
                            context.goNamed(AppRoute.scheduleDetail.name,
                                queryParameters: {
                                  'id': item.id,
                                  'type': index == 0
                                      ? TransactionType.expense.value.toString()
                                      : TransactionType.income.value.toString()
                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Row(children: [
                              const SizedBox(width: 20),
                              SizedBox(
                                  width: 60,
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                          currencyFormatter.format(item.amount),
                                          style: TextStyle(
                                            color: schedules[index].textColor,
                                          )))),
                              const SizedBox(width: 20),
                              Text(item.title)
                            ]),
                          )),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
