import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/src/common_widgets/base_input_decoration.dart';
import 'package:suito/src/routing/app_router.dart';

class TransitionTextField<T> extends StatefulWidget {
  final AppRoute route;
  final String initialValue;
  final String labelText;
  final ValueChanged<T?> onChanged;
  final GestureTapCallback? onTap;

  const TransitionTextField({
    super.key,
    required this.route,
    required this.labelText,
    required this.onChanged,
    required this.initialValue,
    this.onTap,
  });

  @override
  State<TransitionTextField> createState() => TransitionTextFieldState<T>();
}

class TransitionTextFieldState<T> extends State<TransitionTextField<T>> {
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
            final value = await context.pushNamed<T>(widget.route.path);
            _textEditingController.text = value?.toString() ?? '';
            widget.onChanged(value);
          },
          decoration: baseInputDecoration(
              labelText: widget.labelText, context: context),
        ),
      ],
    );
  }
}
