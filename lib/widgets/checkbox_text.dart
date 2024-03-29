import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/cbl.dart';

class CheckBoxText extends StatefulWidget {
  // final String text;
  final int boxColor;
  final Function(bool value) onCheckboxChanged;

  const CheckBoxText(
      {super.key, this.boxColor = CBL.white, required this.onCheckboxChanged});

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
      padding: const EdgeInsets.only(right: CBL.smallPadding),
      child: SizedBox(
        width: CBL.checkboxDimensions,
        height: CBL.checkboxDimensions,
        child: Checkbox(
          activeColor: Color(widget.boxColor),
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: passwordCheck,
          onChanged: (bool? value) {
            setState(() {
              passwordCheck = value!;
            });
            widget.onCheckboxChanged(value!);
          },
        ),
      ),
    );
  }
}
