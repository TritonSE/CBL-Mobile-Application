import 'package:call_black_line/widgets/cbl.dart';
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
    this.width = CBL.buttonWidth,
    this.opacity = CBL.orangeOpacity,
    this.buttonColor = const Color(CBL.orange),
    this.borderColor = const Color(CBL.orange),
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: SizedBox(
        height: CBL.boxHeight,
        width: width,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(CBL.borderRadiusLarge),
              ),
              color: Color(CBL.primaryOrange),
            ),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    fontSize: CBL.fontSize,
                    fontFamily: CBL.fontFamily,
                    fontWeight: CBL.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
