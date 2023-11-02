import 'package:call_black_line/widgets/cbl.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final int borderColor;
  final int textColor;
  final String text;
  final IconData? icon;
  final TextEditingController titleController;
  final double? paddingTop;

  const InputField({
    super.key,
    required this.borderColor,
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
      padding: EdgeInsets.only(top: widget.paddingTop ?? CBL.padding),
      child: TextFormField(
        controller: widget.titleController,
        minLines: CBL.minLines,
        maxLines: CBL.maxLines,
        cursorColor: Color(widget.borderColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(CBL.padding),
          floatingLabelStyle: TextStyle(
            fontSize: CBL.fontSize,
            color: Color(widget.borderColor),
            fontWeight: CBL.bold,
            fontFamily: CBL.fontFamily,
          ),
          prefixIcon: widget.icon != null
              ? Icon(
                  widget.icon,
                  color: Color(widget.borderColor),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(CBL.borderRadiusLarge),
            borderSide: BorderSide(
              width: 1,
              color: Color(widget.borderColor),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(CBL.borderRadiusLarge),
            borderSide: BorderSide(
              width: 1,
              color: Color(widget.borderColor),
            ),
          ),
          labelText: widget.text,
          alignLabelWithHint: true,
          labelStyle: TextStyle(
            color: Color(widget.textColor),
          ),
        ),
        style: TextStyle(
          fontSize: CBL.fontSize,
          color: Color(CBL.black),
          fontWeight: CBL.bold,
          fontFamily: CBL.fontFamily,
          height: CBL.textHeight,
        ),
      ),
    );
  }
}
