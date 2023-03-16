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
      padding: EdgeInsets.only(top: paddingTop ?? 16.0),
      child: TextFormField(
        minLines: 1,
        maxLines: 3,
        cursorColor: Color(borderColor),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16.0),
          floatingLabelStyle: TextStyle(
            fontSize: 17,
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
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              width: 1,
              color: Color(borderColor),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
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
          fontSize: 17,
          color: Colors.black,
          fontWeight: CBL.bold,
          fontFamily: CBL.fontFamily,
          height: 1.5,
        ),
      ),
    );
  }
}
