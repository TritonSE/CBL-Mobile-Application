import 'package:call_black_line/widgets/cbl.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final int borderColor;
  final int iconColor;
  final int textColor;
  final String text;
  final IconData? icon;
  final TextEditingController titleController;
  final double? paddingTop;

  const InputField({
    super.key,
    required this.borderColor,
    required this.iconColor,
    required this.textColor,
    required this.text,
    required this.icon,
    required this.titleController,
    this.paddingTop,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    widget.titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding: EdgeInsets.only(top: widget.paddingTop ?? CBL.padding),
      padding: const EdgeInsets.only(top: CBL.horizontalPadding, bottom: 40),
      child: SizedBox(
      width: double.infinity,
      height: CBL.inputHeight,
      child:
        TextFormField(
          controller: widget.titleController,
          minLines: CBL.minLines,
          maxLines: CBL.maxLines,
          cursorColor: Color(widget.borderColor),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(CBL.padding),
            floatingLabelStyle: TextStyle(
              fontSize: 0,
              color: Color(widget.borderColor),
              fontWeight: CBL.bold,
              fontFamily: CBL.fontFamily,
            ),
            prefixIcon: widget.icon != null
                ? Icon(
                    widget.icon,
                    color: Color(widget.iconColor),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(CBL.borderRadiusSmall),
              borderSide: BorderSide(
                width: 1.5,
                color: Color(widget.borderColor),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(CBL.borderRadiusSmall),
              borderSide: BorderSide(
                width: 1.5,
                color: Color(widget.borderColor),
              ),
            ),
            labelText: widget.text,
            //alignLabelWithHint: true,
            labelStyle: TextStyle(
              color: Color(widget.textColor),
            ),
          ),
          style: TextStyle(
            fontSize: CBL.fieldTitleFontSize,
            color: Color(CBL.black),
            fontWeight: CBL.bold,
            fontFamily: CBL.fontFamily,
          ),
        ),
      ),
    );
  }
}
