import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final int borderColor;
  final int textColor;
  final String text;
  final IconData icon;
  final TextEditingController titleController;
  const InputField(
      {super.key,
      required this.borderColor,
      required this.textColor,
      required this.text,
      required this.icon,
      required this.titleController});

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
      padding: const EdgeInsets.only(top: 16.0),
      child: TextFormField(
        controller: widget.titleController,
        cursorColor: Color(widget.borderColor),
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(
            fontSize: 17,
            color: Color(widget.borderColor),
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),
          prefixIcon: Icon(
            widget.icon,
            color: Color(widget.borderColor),
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
          labelStyle: TextStyle(
            color: Color(widget.textColor),
          ),
        ),
        style: const TextStyle(
          fontSize: 17,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
        ),
      ),
    );
  }
}
