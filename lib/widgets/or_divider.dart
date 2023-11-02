import 'package:call_black_line/widgets/cbl.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: CBL.padding),
            child: Divider(
              color: Color(CBL.veryLightGray),
              thickness: CBL.thickness,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: CBL.horizontalPadding),
          child: Text(
            'or',
            style: TextStyle(
                color: Color(CBL.veryLightGray),
                fontFamily: CBL.fontFamily,
                fontSize: CBL.fontSize),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: CBL.padding),
            child: Divider(
              color: Color(CBL.veryLightGray),
              thickness: CBL.thickness,
            ),
          ),
        )
      ],
    );
  }
}
