import 'package:call_black_line/widgets/orange_button.dart';
import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/cbl.dart';

class Affirmation extends StatefulWidget {
  final bool subscribed;
  const Affirmation({super.key, this.subscribed = false});

  @override
  State<Affirmation> createState() => _AffirmationState();
}

class _AffirmationState extends State<Affirmation> {
  bool subscribed = false;

  @override
  void initState() {
    super.initState();
    subscribed = widget.subscribed;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(onBackButtonPressed: () {
        Navigator.pushNamed(context, '/resources');
      }),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: CBL.padding,
        ),
        child: Column(
          children: [
            const CustomTitle(text: 'Affirmation'),
            SizedBox(
              width: 358,
              child: Text(
                'Subscribe to our affirmation resources to receive daily, weekly, or monthly affirmations from members in the community.',
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: CBL.fontFamily,
                    fontWeight: CBL.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            if (subscribed)
              Column(
                children: [
                  Text("Subscribed!",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: CBL.fontFamily,
                        fontWeight: CBL.bold,
                        color: Color(CBL.primaryOrange),
                      )),
                  SizedBox(height: CBL.padding),
                ],
              ),
            OrangeButton(
              buttonText: 'Subscribe',
              width: 146,
              onTap: () => setState(() => subscribed = true),
              opacity: subscribed ? 0.45 : 1,
            ),
            SizedBox(
              height: CBL.padding,
            ),
            if (subscribed)
              GestureDetector(
                onTap: () => setState(() => subscribed = false),
                child: Text(
                  "Unsubscribe",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 17,
                      fontFamily: CBL.fontFamily,
                      fontWeight: CBL.bold,
                      color: Color(CBL.textGray)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
