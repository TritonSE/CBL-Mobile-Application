import 'package:call_black_line/widgets/input_field.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField(
      {Key? key,
      required this.inputOutlineColor,
      required this.inputTextColor,
      required this.inputText,
      required this.aboveText,
      this.paddingTop,
      this.icon})
      : super(key: key);

  final int inputOutlineColor;
  final int inputTextColor;
  final String inputText;
  final String aboveText;
  final double? paddingTop;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            aboveText,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              fontFamily: 'Inter',
            ),
          ),
        ),
        InputField(
            paddingTop: paddingTop,
            borderColor: inputOutlineColor,
            textColor: inputTextColor,
            text: inputText,
            icon: icon),
      ],
    );
  }
}