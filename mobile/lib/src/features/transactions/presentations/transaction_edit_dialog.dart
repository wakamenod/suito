import 'package:flutter/material.dart';

class TransactionEditDialog extends StatelessWidget {
  const TransactionEditDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const FlutterLogo(
              size: 150,
            ),
            const Text(
              "This is a Custom Dialog",
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"))
          ],
        ),
      ),
    );
  }
}
