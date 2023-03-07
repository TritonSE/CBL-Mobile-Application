import 'package:call_black_line/pages/affirmation.dart';
import 'package:call_black_line/pages/call_text_now.dart';
import 'package:call_black_line/pages/create_account.dart';
import 'package:call_black_line/pages/have_your_voice_heard.dart';
import 'package:call_black_line/widgets/custom_navbar.dart';
import 'package:call_black_line/pages/donation.dart';

import 'package:flutter/material.dart';
import 'package:call_black_line/pages/take_action.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/rounded_button_image.dart';
// import 'package:call_black_line/take_action.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Call Blackline',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
          ),
        ),
        routes: {
          // '/': (context) => const SeekHelp(),
          // '/': (context) => const Donation(),
          '/': (context) => const HaveYourVoiceHeard(),
          '/callTextNow': (context) => const CallTextNow(),
          '/createAccount': (context) => const CreateAccount(),
          '/takeAction': (context) => const TakeActionPage(),
        }
        // home: SeekHelp(),

        );
  }
}

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
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
            const SizedBox(
              height: 16,
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
            const SizedBox(
              width: 333,
              child: Text(
                'BlackLine is non-judgmental, affirming and supportive, listener-witnessing and information gathering about your experience.',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const SizedBox(
              width: 358,
              child: Text(
                'BlackLine® provides a space for peer support, counseling, witnessing and affirming the lived experiences to folks who are most impacted by systematic oppression with an LGBTQ+ Black Femme Lens.',
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
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
