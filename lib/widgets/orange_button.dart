import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  final double width;
  final double opacity;
  const OrangeButton(
      {Key? key,
      this.buttonText = "Button",
      this.onTap,
      this.width = 121,
      this.opacity = 1})
      : super(key: key);

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
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              color: Color(0xffdf742c),
            ),
            child: Center(
              child: Text(
                buttonText,
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
