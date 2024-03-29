import 'package:call_black_line/widgets/cbl.dart';
import 'package:call_black_line/widgets/input_field.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  TextInputField(
      {Key? key,
      required this.inputOutlineColor,
      required this.inputTextColor,
      required this.inputText,
      required this.aboveText,
      required this.titleController,
      this.paddingTop,
      this.icon})
      : super(key: key);

  final int inputOutlineColor;
  final int inputTextColor;
  final String inputText;
  final String aboveText;
  final double? paddingTop;
  final IconData? icon;
  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            aboveText,
            style: TextStyle(
              fontWeight: CBL.bold,
              fontSize: CBL.textBoxFontSize,
              fontFamily: CBL.fontFamily,
            ),
          ),
        ),
        InputField(
            paddingTop: paddingTop,
            borderColor: inputOutlineColor,
            iconColor: inputOutlineColor,
            textColor: inputTextColor,
            text: inputText,
            titleController: titleController,
            icon: icon),
      ],
    );
  }
}
