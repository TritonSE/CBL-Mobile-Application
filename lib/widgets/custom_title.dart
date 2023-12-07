import 'package:call_black_line/widgets/cbl.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String text;
  final double topPadding;
  final double bottomPadding;

  const CustomTitle(
      {super.key,
      required this.text,
      this.topPadding = CBL.largePadding,
      this.bottomPadding = CBL.largePadding});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: CBL.fontSizeLarge,
              letterSpacing: CBL.letterSpacing,
              fontFamily: CBL.fontFamily),
        ),
      ),
    );
  }
}
