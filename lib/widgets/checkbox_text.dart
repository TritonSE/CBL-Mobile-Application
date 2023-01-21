import 'package:flutter/material.dart';

class CheckBoxText extends StatefulWidget {
  // final String text;
  final int boxColor;
  const CheckBoxText({
    super.key,
    // this.text = "Text",
    this.boxColor = 0xffffffff,
  });

  @override
  State<CheckBoxText> createState() => _CheckBoxTextState();
}

class _CheckBoxTextState extends State<CheckBoxText> {
  bool passwordCheck = false;

  Color getColor(Set<MaterialState> states) {
    return Color(widget.boxColor);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: SizedBox(
        width: 24,
        height: 24,
        child: Checkbox(
          activeColor: Color(widget.boxColor),
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: passwordCheck,
          onChanged: (bool? value) {
            setState(() {
              passwordCheck = value!;
            });
          },
        ),
      ),
    );
  }
}
