import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/src/common_widgets/base_input_decoration.dart';
import 'package:suito/src/routing/app_router.dart';

class TransitionTextField extends StatefulWidget {
  final AppRoute route;
  final String initialValue;
  final String Function(String)? getValueByID;
  final String labelText;
  final ValueChanged<String> onChanged;
  final GestureTapCallback? onTap;

  const TransitionTextField({
    super.key,
    required this.route,
    required this.labelText,
    required this.onChanged,
    required this.initialValue,
    this.getValueByID,
    this.onTap,
  });

  @override
  State<TransitionTextField> createState() => TransitionTextFieldState();
}

class TransitionTextFieldState extends State<TransitionTextField> {
  late final TextEditingController _textEditingController =
      TextEditingController(text: widget.initialValue);

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _textEditingController,
          readOnly: true,
          onTap: () async {
            widget.onTap?.call();
            final value =
                await context.pushNamed<String>(widget.route.path) ?? '';
            widget.onChanged(value);
            if (widget.getValueByID == null) {
              _textEditingController.text = value;
            } else {
              _textEditingController.text =
                  widget.getValueByID?.call(value) ?? '';
            }
          },
          decoration: baseInputDecoration(
              labelText: widget.labelText, context: context),
        ),
      ],
    );
  }
}
