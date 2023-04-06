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

  final titleController = TextEditingController();
  String text = "No Value Entered";

  void _setText() {
    setState(() {
      text = titleController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: TextFormField(
          cursorColor: Color(widget.borderColor),
          obscureText: widget.hideText,
          controller: titleController,
          decoration: InputDecoration(
              floatingLabelStyle: TextStyle(
                fontSize: 17,
                color: Color(widget.borderColor),
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
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
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  width: 1,
                  color: Color(widget.borderColor),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  width: 1,
                  color: Color(widget.borderColor),
                ),
              ),
              labelText: widget.text,
              labelStyle: TextStyle(color: Color(widget.textColor))),
          style: const TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }
}
