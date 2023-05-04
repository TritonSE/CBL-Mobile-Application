import 'package:call_black_line/widgets/cbl.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final int borderColor;
  final int textColor;
  final String text;
  final IconData? icon;
  final double? paddingTop;
  const InputField(
      {super.key,
      required this.borderColor,
      required this.textColor,
      required this.text,
      required this.icon,
      this.paddingTop});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop ?? CBL.padding),
      child: TextFormField(
        minLines: CBL.minLines,
        maxLines: CBL.maxLines,
        cursorColor: Color(borderColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(CBL.padding),
          floatingLabelStyle: TextStyle(
            fontSize: CBL.fontSize,
            color: Color(borderColor),
            fontWeight: CBL.bold,
            fontFamily: CBL.fontFamily,
          ),
          prefixIcon: icon != null
              ? Icon(
                  icon,
                  color: Color(borderColor),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(CBL.borderRadiusLarge),
            borderSide: BorderSide(
              width: 1,
              color: Color(borderColor),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(CBL.borderRadiusLarge),
            borderSide: BorderSide(
              width: 1,
              color: Color(borderColor),
            ),
          ),
          alignLabelWithHint: true,
          labelText: text,
          labelStyle: TextStyle(
            color: Color(textColor),
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
