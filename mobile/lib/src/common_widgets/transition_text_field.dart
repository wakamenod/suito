import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/src/common_widgets/base_input_decoration.dart';
import 'package:suito/src/routing/app_router.dart';

class TransitionTextField extends StatefulWidget {
  final AppRoute route;
  final String initialValue;
  final String labelText;
  final ValueChanged<String> onChanged;

  const TransitionTextField({
    super.key,
    required this.route,
    required this.labelText,
    required this.onChanged,
    required this.initialValue,
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
            final val = await context.pushNamed<String>(widget.route.name,
                    extra: widget.initialValue) ??
                '';
            _textEditingController.text = val;
            widget.onChanged(val);
          },
          decoration: baseInputDecoration(
              labelText: widget.labelText, context: context),
        ),
      ],
    );
  }
}
