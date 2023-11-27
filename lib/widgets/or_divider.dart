import 'package:call_black_line/widgets/cbl.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child:  Divider(
            color: Color(CBL.textGray),
            thickness: CBL.thickness,
          ),

        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            'OR',
            style: TextStyle(
                color: Color(CBL.textGray),
                fontFamily: CBL.fontFamily,
                fontSize: CBL.fontSize),
          ),
        ),
        Expanded(
          child: Divider(
            color: Color(CBL.textGray),
            thickness: CBL.thickness,
          ),
        )
      ],
    );
  }
}
