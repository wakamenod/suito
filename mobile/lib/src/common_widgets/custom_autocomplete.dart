import 'package:flutter/material.dart';

class CustomAutocomplete extends StatelessWidget {
  final Iterable<String> categoryItems;
  final TextEditingController textEditingController = TextEditingController();

  CustomAutocomplete({super.key, required this.categoryItems});

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return categoryItems;
        }
        return categoryItems.where(
            (option) => option.contains(textEditingValue.text.toLowerCase()));
      },
      onSelected: (String selection) {
        debugPrint('Selected $selection');
      },
    );
  }
}
