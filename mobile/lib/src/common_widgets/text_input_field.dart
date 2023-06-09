import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum InputType {
  text,
  digits,
  date,
}

class TextInputField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final String? errorText;
  final InputType inputType;
  final bool obscureText;
  final TextEditingController _textEditingController = TextEditingController();

  TextInputField({
    super.key,
    required this.hintText,
    this.onChanged = _defaultOnChange,
    this.errorText,
    this.inputType = InputType.text,
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
            controller: _textEditingController,
            onChanged: onChanged,
            readOnly: inputType == InputType.date,
            onTap: inputType != InputType.date
                ? null
                : () => _showDialog(context, _textEditingController),
            keyboardType:
                inputType == InputType.digits ? TextInputType.number : null,
            inputFormatters: inputType == InputType.digits
                ? [FilteringTextInputFormatter.digitsOnly]
                : null,
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

  // This function displays a CupertinoModalPopup with a reasonable fixed height
  // which hosts CupertinoDatePicker.
  void _showDialog(BuildContext context, TextEditingController controller) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system
              // navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: CupertinoDatePicker(
                  // initialDateTime: date,
                  mode: CupertinoDatePickerMode.date,
                  // This shows day of week alongside day of month
                  showDayOfWeek: false,
                  // This is called when the user changes the date.
                  onDateTimeChanged: (DateTime newDate) {
                    controller.text = newDate.toString();
                  },
                ),
              ),
            ));
  }
}
