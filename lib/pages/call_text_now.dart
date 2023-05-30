import 'package:call_black_line/widgets/cbl.dart';
import 'package:call_black_line/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/rounded_button_image.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:call_black_line/auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class CallTextNow extends StatelessWidget {
  const CallTextNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(onBackButtonPressed: () {
        print("back button was pressed from calltext");
      }),
      bottomNavigationBar: CustomNavBar(
        currentPage: 'Seek Help',
        seekHelpRoute: '/callTextNow',
        profileRoute: '/profile',
        resourcesRoute: '/resources',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: CBL.padding,
        ),
        child: Column(
          children: [
            const CustomTitle(text: 'Call or Text Now'),
            SizedBox(
              width: 358,
              child: Text(
                'Have you encountered abusive, physical and disrespectful police or vigilante behavior or were you attacked because you did not belong in a store, business, certain community or neighborhood?',
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
            Text(
              'Contact BlackLine and report your incident.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontFamily: CBL.fontFamily,
                color: Color(CBL.black),
                fontWeight: FontWeight.w600,
              ),
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
                    onTap: () async {
                      final Uri url = Uri(
                        scheme: 'tel',
                        path: "+1-800-604-5841",
                      );
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        throw Exception(
                            "Error occured trying to call that number.");
                      }
                    },
                    height: 171,
                    width: 171,
                    imageURL: 'assets/images/call.jpg',
                    text: 'Call 1(800) 604-5841',
                    textPaddingTop: CBL.padding,
                    textContainerAlignment: Alignment.topCenter,
                    textContainerWidth: 100,
                  ),
                ),
                SizedBox(
                  width: CBL.padding,
                  height: CBL.padding,
                ),
                Expanded(
                  flex: 1,
                  child: RoundedButtonImage(
                    height: 171,
                    width: 171,
                    imageURL: 'assets/images/text.jpg',
                    text: 'Text 1(800) 604-5841',
                    textPaddingTop: CBL.padding,
                    textContainerAlignment: Alignment.topCenter,
                    textContainerWidth: 100,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
