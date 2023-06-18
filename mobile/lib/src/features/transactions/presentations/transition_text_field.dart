import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suito/src/routing/app_router.dart';

// TODO 見直し
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
            readOnly: true,
            onTap: () async {
              final val =
                  await context.pushNamed<String>(widget.route.name) ?? '';
              _textEditingController.text = val;
              widget.onChanged(val);
            },
            //          obscureText: obscureText,
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
      ],
    );
  }
}
