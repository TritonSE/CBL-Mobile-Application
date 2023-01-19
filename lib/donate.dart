import 'package:flutter/material.dart';

class Donate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const <Widget>[
        Text('Donate',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34)),
        Text(
          'Your support will ensure that someone hurting has someone to talk to.',
          style: TextStyle(fontSize: 17),
          textAlign: TextAlign.center,
        ),
        Text(
          'Call BlackLine is a non-profit, tax-exempt corporation recognized under Section 501(c)(3) of the Internal Revenue Code.',
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
