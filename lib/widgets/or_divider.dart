import 'package:call_black_line/widgets/cbl.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  int veryLightGray = 0xffD8D8D8;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: CBL.padding),
            child: Divider(
              color: Color(veryLightGray),
              thickness: 1,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'or',
            style: TextStyle(
                color: Color(veryLightGray),
                fontFamily: CBL.fontFamily,
                fontSize: 17),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: CBL.padding),
            child: Divider(
              color: Color(veryLightGray),
              thickness: 1,
            ),
          ),
        )
      ],
    );
  }
}
