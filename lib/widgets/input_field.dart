import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final int borderColor;
  final int textColor;
  final String text;
  final IconData icon;
  const InputField(
      {super.key,
      required this.borderColor,
      required this.textColor,
      required this.text,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: TextFormField(
        cursorColor: Color(borderColor),
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(
            fontSize: 17,
            color: Color(borderColor),
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),
          prefixIcon: Icon(
            icon,
            color: Color(borderColor),
          ),
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
          labelText: text,
          labelStyle: TextStyle(
            color: Color(textColor),
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
