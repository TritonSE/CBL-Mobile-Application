import 'package:flutter/material.dart';

class Donate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Donate',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34)),
        const Padding(
          padding: EdgeInsets.all(30),
          child: Text(
            'Your support will ensure that someone hurting has someone to talk to.',
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color(0xFFDF742C),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0))),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
              child: Text("Donate", style: TextStyle(color: Colors.white)),
            ),
            onPressed: () {
              // Perform action
            },
          ),
        ),
        const Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              'Call BlackLine is a non-profit, tax-exempt corporation recognized under Section 501(c)(3) of the Internal Revenue Code.',
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ))
      ],
    );
  }
}
