import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    Key? key,
    required this.veryLightGray,
  }) : super(key: key);

  final int veryLightGray;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
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
                color: Color(veryLightGray), fontFamily: 'Inter', fontSize: 17),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
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
