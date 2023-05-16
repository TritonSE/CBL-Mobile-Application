import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  final int maxLines;
  final Color textColor;
  final String hintText;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  const TextArea({
    super.key,
    this.maxLines = 3,
    this.textColor = Colors.black,
    this.hintText = "",
    this.enabledBorderColor = Colors.grey,
    this.focusedBorderColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: TextStyle(color: textColor),
        keyboardType: TextInputType.multiline,
        maxLines: maxLines,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: enabledBorderColor)),
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: focusedBorderColor))));
  }
}
