import 'package:call_black_line/call_text_now.dart';
import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  const OrangeButton({Key? key, this.buttonText = "Button", this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 121,
      child: GestureDetector(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            color: Color(0xffdf742c),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
