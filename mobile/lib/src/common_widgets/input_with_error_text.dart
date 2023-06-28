import 'package:flutter/material.dart';

class InputWithErorrText extends StatelessWidget {
  const InputWithErorrText(
      {super.key, required this.errorText, required this.inputField});

  final String? errorText;
  final Widget inputField;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        inputField,
        if (errorText != null)
          Padding(
            padding:
                const EdgeInsets.only(left: 16, top: 4, right: 16, bottom: 0),
            child: Text(
              errorText!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
      ],
    );
  }
}
