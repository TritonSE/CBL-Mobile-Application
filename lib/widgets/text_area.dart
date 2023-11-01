import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/cbl.dart';

class TextArea extends StatelessWidget {
  final int maxLines;
  final Color textColor;
  final String hintText;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final TextEditingController controller;
  const TextArea(
      {super.key,
      this.maxLines = CBL.maxLines,
      this.textColor = Colors.black,
      this.hintText = "",
      this.enabledBorderColor = Colors.grey,
      this.focusedBorderColor = Colors.grey,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        style: TextStyle(color: textColor),
        keyboardType: TextInputType.multiline,
        maxLines: maxLines,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(CBL.borderRadiusLarge),
                borderSide: BorderSide(color: enabledBorderColor)),
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(CBL.borderRadiusLarge),
                borderSide: BorderSide(color: focusedBorderColor))));
  }
}
