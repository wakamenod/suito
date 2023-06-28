import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:suito/src/common_widgets/base_input_decoration.dart';
import 'input_with_error_text.dart';

class CurrencyInputField extends StatefulWidget {
  final String labelText;
  final ValueChanged<int> onChanged;
  final String? errorText;
  final int initialValue;
  final NumberFormat formatter;

  const CurrencyInputField({
    super.key,
    required this.labelText,
    required this.initialValue,
    required this.onChanged,
    this.errorText,
    required this.formatter,
  });

  @override
  State<CurrencyInputField> createState() => _CurrencyInputFieldState();
}

class _CurrencyInputFieldState extends State<CurrencyInputField> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.formatter.format(widget.initialValue));
  // TODO i18n対応 小数点以下がある通貨の場合数値に戻す時に小数点以下が自動で挿入される
  final regexExceptNumber = RegExp(r'[^\d]');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InputWithErorrText(
        errorText: widget.errorText,
        inputField: Focus(
          onFocusChange: (hasFocus) {
            // TODO ロジックをテスト出来るように移動
            if (hasFocus) {
              _controller.text =
                  _controller.text.replaceFirst(RegExp(r'^0+'), '');
            } else {
              final text = widget.formatter.format(int.tryParse(
                      _controller.text.replaceAll(regexExceptNumber, '')) ??
                  0);
              _controller.text = text;
            }
          },
          child: TextField(
            controller: _controller,
            onTap: () {
              _controller.text =
                  _controller.text.replaceAll(regexExceptNumber, '');
            },
            onSubmitted: (value) {
              final text = widget.formatter.format(int.tryParse(value) ?? 0);
              _controller.text = text;
            },
            onChanged: (val) {
              widget.onChanged(int.tryParse(val) ?? 0);
            },
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: baseInputDecoration(
                labelText: widget.labelText,
                context: context,
                isRequired: true),
          ),
        ));
  }
}
