import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suito/src/utils/datetime_utils.dart';

class TransactionDatePicker extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String date;

  const TransactionDatePicker({
    super.key,
    required this.onChanged,
    required this.date,
  });

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        _showCupertinoDatePicker(context, onChanged);
      },
      child: Row(
        children: [
          const Icon(Icons.calendar_today),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 20, 0),
            child: Row(
              children: [
                Text(DateTime.parse(date).toYMD()),
                const Icon(Icons.expand_more),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showCupertinoDatePicker(
      BuildContext context, ValueChanged<String> onChanged) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.parse(date),
                  mode: CupertinoDatePickerMode.date,
                  showDayOfWeek: true,
                  onDateTimeChanged: (DateTime newDate) {
                    final val = newDate.toString();
                    onChanged(val);
                  },
                ),
              ),
            ));
  }
}
