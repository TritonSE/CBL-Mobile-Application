import 'package:call_black_line/widgets/cbl.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  String text;
  int borderColor;
  int textColor;
  double bottomPadding;
  bool hideText = true;
  TextEditingController titleController;
  PasswordField(
      {super.key,
      required this.text,
      required this.borderColor,
      required this.bottomPadding,
      required this.textColor,
      required this.titleController});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

  void _toggle() {
    setState(() => widget.hideText = !widget.hideText);
  }

  String text = "No Value Entered";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    widget.titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: CBL.horizontalPadding,
        bottom: widget.bottomPadding,
      ),
      child: SizedBox(
        width: double.infinity,
        height: CBL.boxHeight,
        child: TextFormField(
          cursorColor: Color(widget.borderColor),
          obscureText: widget.hideText,
          controller: widget.titleController,
          decoration: InputDecoration(
              floatingLabelStyle: TextStyle(
                fontSize: CBL.fontSize,
                color: Color(widget.borderColor),
                fontWeight: CBL.bold,
                fontFamily: CBL.fontFamily,
              ),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(CBL.primaryOrange),
              ),
              suffixIcon: IconButton(
                icon: widget.hideText
                    ? Icon(
                        Icons.visibility_off,
                        color: Color(CBL.primaryOrange),
                      )
                    : Icon(
                        Icons.visibility,
                        color: Color(CBL.primaryOrange),
                      ),
                onPressed: _toggle,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(CBL.borderRadiusSmall),
                borderSide: BorderSide(
                  width: 1,
                  color: Color(widget.borderColor),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(CBL.borderRadiusSmall),
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
