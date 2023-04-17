import 'package:call_black_line/pages/call_text_now.dart';
import 'package:call_black_line/pages/create_account.dart';
import 'package:call_black_line/pages/create_affirmation.dart';
import 'package:call_black_line/pages/seek_help.dart';

import 'package:flutter/material.dart';
import 'package:call_black_line/pages/take_action.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Call BlackLine',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
          ),
        ),
        routes: {
          '/': (context) => const SeekHelp(),
          // '/': (context) => const Donation(),
          // '/': (context) => const Profile(),
          // '/': (context) => const HaveYourVoiceHeard(),
          // '/': (context) => const CreateAffirmation(),
          '/callTextNow': (context) => const CallTextNow(),
          '/createAccount': (context) => const CreateAccount(),
          '/takeAction': (context) => const TakeActionPage(),
        }
        // home: SeekHelp(),

        );
  }
}