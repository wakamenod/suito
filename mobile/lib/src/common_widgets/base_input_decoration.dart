import 'package:flutter/material.dart';

InputDecoration baseInputDecoration(
    {required String labelText,
    required BuildContext context,
    bool isRequired = false}) {
  return InputDecoration(
    label: RichText(
      text: TextSpan(
        text: labelText,
        style: DefaultTextStyle.of(context).style,
        children: isRequired
            ? const <TextSpan>[
                TextSpan(
                    text: ' ★', style: TextStyle(color: Color(0XFFF29C97))),
              ]
            : [],
      ),
    ),
    // labelText: labelText,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey[400]!,
        width: 1.0,
      ),
    ),
    border: const OutlineInputBorder(),
    filled: true,
    fillColor: Colors.white,
    hintText: labelText,
    hintStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(194, 194, 194, 1.0),
    ),
  );
}
