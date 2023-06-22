import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputField extends StatefulWidget {
  final String labelText;
  final ValueChanged<int> onChanged;
  final String? errorText;
  final int initialValue;
  final bool obscureText;
  final NumberFormat formatter;

  const CurrencyInputField({
    super.key,
    required this.labelText,
    required this.initialValue,
    required this.onChanged,
    this.errorText,
    this.obscureText = false,
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
          child: Focus(
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
                final text = widget.formatter.format(int.parse(value));
                _controller.text = text;
              },
              onChanged: (val) {
                widget.onChanged(int.tryParse(val) ?? 0);
              },
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              obscureText: widget.obscureText,
              decoration: InputDecoration(
                labelText: widget.labelText,
                border: InputBorder.none,
                hintText: widget.labelText,
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(194, 194, 194, 1.0),
                ),
              ),
            ),
          ),
        ),
        if (widget.errorText != null)
          Padding(
            padding:
                const EdgeInsets.only(left: 16, top: 4, right: 16, bottom: 0),
            child: Text(
              widget.errorText!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
      ],
    );
  }
}
