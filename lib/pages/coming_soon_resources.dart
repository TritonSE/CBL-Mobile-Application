import 'package:call_black_line/widgets/orange_button.dart';
import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/custom_navbar.dart';
import 'package:call_black_line/widgets/text_area.dart';
import 'package:call_black_line/pages/affirmation_sent.dart';
import 'package:call_black_line/widgets/cbl.dart';
import 'package:call_black_line/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/rounded_button_image.dart';
import 'package:url_launcher/url_launcher.dart';

class ComingSoonResources extends StatelessWidget {
  const ComingSoonResources({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(onBackButtonPressed: () {
        print("back button was pressed from affirmation");
        Navigator.pushNamed(context, '/callTextNow');
      }),
      bottomNavigationBar: CustomNavBar(
        currentPage: 'Resources',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: CBL.padding,
        ),
        child: Column(
          children: [
            const CustomTitle(text: 'Coming Soon!'),
            SizedBox(
              width: 358,
              child: Text(
                'Our app is under construction! Stay tuned for the resources page, arriving in the next version of our app!',
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
            SizedBox(
              height: CBL.padding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: RoundedButtonImage(
                    height: 171,
                    width: 171,
                    imageURL: 'assets/images/call-blackline-black.png',
                    text: '',
                    textPaddingTop: CBL.padding,
                    textContainerAlignment: Alignment.topCenter,
                    textContainerWidth: 100,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
