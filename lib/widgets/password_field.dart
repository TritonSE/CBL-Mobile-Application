import 'package:call_black_line/widgets/cbl.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  String text;
  int borderColor;
  int textColor;
  bool hideText = true;
  PasswordField(
      {super.key,
      required this.text,
      required this.borderColor,
      required this.textColor});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  void _toggle() {
    setState(() => widget.hideText = !widget.hideText);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: CBL.padding,
      ),
      child: SizedBox(
        width: double.infinity,
        height: CBL.boxHeight,
        child: TextFormField(
          cursorColor: Color(widget.borderColor),
          obscureText: widget.hideText,
          decoration: InputDecoration(
              floatingLabelStyle: TextStyle(
                fontSize: CBL.fontSize,
                color: Color(widget.borderColor),
                fontWeight: CBL.bold,
                fontFamily: CBL.fontFamily,
              ),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(widget.borderColor),
              ),
              suffixIcon: IconButton(
                icon: widget.hideText
                    ? Icon(
                        Icons.visibility_off,
                        color: Color(widget.borderColor),
                      )
                    : Icon(
                        Icons.visibility,
                        color: Color(widget.borderColor),
                      ),
                onPressed: _toggle,
              ),
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
              labelStyle: TextStyle(color: Color(widget.textColor))),
          style: TextStyle(
            fontSize: CBL.fontSize,
            color: Color(CBL.black),
            fontWeight: CBL.bold,
            fontFamily: CBL.fontFamily,
          ),
        ),
      ),
    );
  }
}
