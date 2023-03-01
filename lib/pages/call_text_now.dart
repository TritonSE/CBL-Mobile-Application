import 'package:call_black_line/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/rounded_button_image.dart';

class CallTextNow extends StatelessWidget {
  const CallTextNow({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Header(),
      bottomNavigationBar: CustomNavBar(
        currentPage: 'Profile',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            CustomTitle(text: 'Call or Text Now'),
            const SizedBox(
              width: 358,
              child: Text(
                'Have you encountered abusive, physical and disrespectful police or vigilante behavior or were you attacked because you did not belong in a store, business, certain community or neighborhood?',
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            const Text(
              'Contact BlackLine and report your incident.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Inter',
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                  flex: 1,
                  child: RoundedButtonImage(
                    height: 171,
                    width: 171,
                    imageURL: 'assets/images/call.jpg',
                    text: 'Call 1(800) 604-5841',
                    textPaddingTop: 16.0,
                    textContainerAlignment: Alignment.topCenter,
                    textContainerWidth: 100,
                  ),
                ),
                SizedBox(
                  width: 16,
                  height: 16,
                ),
                Expanded(
                  flex: 1,
                  child: RoundedButtonImage(
                    height: 171,
                    width: 171,
                    imageURL: 'assets/images/text.jpg',
                    text: 'Text 1(800) 604-5841',
                    textPaddingTop: 16.0,
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