import 'package:flutter/material.dart';

class CustomAutocomplete extends StatelessWidget {
  final Iterable<String> items;
  final TextEditingController textEditingController = TextEditingController();

  CustomAutocomplete({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return items;
        }
        return items.where(
            (option) => option.contains(textEditingValue.text.toLowerCase()));
      },
      onSelected: (String selection) {
        debugPrint('Selected $selection');
      },
    );
  }
}
