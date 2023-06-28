import 'package:flutter/material.dart';
import 'package:suito/src/common_widgets/base_input_decoration.dart';
import 'package:suito/src/common_widgets/input_with_error_text.dart';

class TextInputField extends StatelessWidget {
  final String labelText;
  final ValueChanged<String> onChanged;
  final String? errorText;
  final String initialValue;

  const TextInputField({
    super.key,
    required this.labelText,
    required this.initialValue,
    this.onChanged = _defaultOnChange,
    this.errorText,
  });

  static void _defaultOnChange(String value) {}

  @override
  Widget build(BuildContext context) {
    return InputWithErorrText(
        errorText: errorText,
        inputField: TextFormField(
          initialValue: initialValue,
          onChanged: onChanged,
          decoration: baseInputDecoration(
              labelText: labelText, context: context, isRequired: true),
        ));
  }
}
