import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final String? errorText;
  final bool digitsOnly;
  final bool obscureText;

  const TextInputField({
    super.key,
    required this.hintText,
    this.onChanged = _defaultOnChange,
    this.errorText,
    this.digitsOnly = false,
    this.obscureText = false,
  });

  static void _defaultOnChange(String value) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color.fromRGBO(208, 208, 208, 1.0),
                width: 1.5,
              )),
          child: TextField(
            onChanged: onChanged,
            keyboardType: digitsOnly ? TextInputType.number : null,
            inputFormatters:
                digitsOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
            obscureText: obscureText,
            decoration: InputDecoration(
              labelText: 'Enter your title',
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(194, 194, 194, 1.0),
              ),
            ),
          ),
        ),
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
