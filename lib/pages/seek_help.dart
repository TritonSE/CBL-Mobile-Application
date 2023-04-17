import 'package:flutter/material.dart';

import '../widgets/cbl.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/custom_title.dart';
import '../widgets/header.dart';
import '../widgets/rounded_button_image.dart';

class SeekHelp extends StatelessWidget {
  const SeekHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavBar(
        currentPage: 'Seek Help',
      ), //Available: Resources, Seek Help, Profile
      appBar: const Header(
        isHome: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: CBL.padding),
        child: Column(
          children: [
            const CustomTitle(text: 'Seek Help'),
            RoundedButtonImage(
              height: 75,
              width: double.infinity,
              imageURL: 'assets/images/call.jpg',
              text: 'Call or Text',
              onTap: () => Navigator.pushNamed(context, '/takeAction'),
            ),
            SizedBox(
              height: CBL.padding,
            ),
            const RoundedButtonImage(
              height: 75,
              width: double.infinity,
              imageURL: 'assets/images/form.jpg',
              text: 'Write',
              // ignore: avoid_print
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: 333,
              child: Text(
                'BlackLine is non-judgmental, affirming and supportive, listener-witnessing and information gathering about your experience.',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: CBL.fontFamily,
                  fontWeight: CBL.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: 358,
              child: Text(
                'BlackLine® provides a space for peer support, counseling, witnessing and affirming the lived experiences to folks who are most impacted by systematic oppression with an LGBTQ+ Black Femme Lens.',
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: CBL.fontFamily,
                  fontWeight: CBL.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
