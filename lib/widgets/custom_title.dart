import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String text;
  final double topPadding;
  final double bottomPadding;

  const CustomTitle(
      {super.key,
      required this.text,
      this.topPadding = 24,
      this.bottomPadding = 24});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 34,
              letterSpacing: 0.4,
              fontFamily: 'Inter'),
        ),
      ),
    );
  }
}
