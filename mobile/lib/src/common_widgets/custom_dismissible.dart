import 'package:flutter/material.dart';
import 'package:suito/i18n/translations.g.dart';

class CustomDismissible extends StatelessWidget {
  const CustomDismissible(
      {required super.key, this.onDismissed, required this.child});

  final DismissDirectionCallback? onDismissed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key!,
      onDismissed: onDismissed,
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(t.general.dismissible.confirmContent),
              content: Text(t.general.dismissible.confirmContent),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(t.general.dismissible.buttonDelete),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
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
      child: child,
    );
  }
}
