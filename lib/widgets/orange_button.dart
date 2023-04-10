import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  final double width;
  final double opacity;
  final Color buttonColor;
  final Color borderColor;
  final Color textColor;
  const OrangeButton({
    Key? key,
    this.buttonText = "Button",
    this.onTap,
    this.width = 121,
    this.opacity = 1,
    this.buttonColor = const Color(0xffdf742c),
    this.borderColor = const Color(0xffdf742c),
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: SizedBox(
        height: 48,
        width: width,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              color: buttonColor,
            ),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    color: textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
