import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/common_widgets/async_value_widget.dart';
import 'package:suito/src/constants/app_sizes.dart';
import 'package:suito/src/features/schedules/services/schedule_service.dart';
import 'package:suito/src/features/transactions/services/transaction/transaction_service.dart';
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
            Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          gapW12,
                          Text(schedules[index].headerText),
                          IconButton(
                            icon: Icon(
                              Icons.add_circle,
                              color: schedules[index].mainColor,
                            ),
                            onPressed: () {
                              context.goNamed(AppRoute.scheduleDetail.name,
                                  queryParameters: {
                                    'id': '',
                                    'type': index == 0
                                        ? TransactionType.expense.value
                                            .toString()
                                        : TransactionType.income.value
                                            .toString()
                                  });
                            },
                          ),
                        ],
                      ),
                      const Divider(
                        height: 0,
                      ),
                    ],
                  ),
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

                        await schedules[index].onDismissed(item.id);

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
                              content:
                                  Text(t.general.dismissible.confirmContent),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child:
                                      Text(t.general.dismissible.buttonDelete),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child:
                                      Text(t.general.dismissible.buttonCancel),
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
                        child: Container(
                          color: Colors.white,
                          child: SizedBox(
                            height: 50,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(item.title),
                                  gapW64,
                                  gapW64,
                                  SizedBox(
                                      width: 64,
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                              currencyFormatter
                                                  .format(item.amount),
                                              style: TextStyle(
                                                color:
                                                    schedules[index].mainColor,
                                              )))),
                                  gapW32
                                ]),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
