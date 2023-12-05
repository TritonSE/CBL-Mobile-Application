import 'package:call_black_line/pages/all_resources.dart';
import 'package:call_black_line/pages/create_account.dart';
import 'package:call_black_line/pages/login.dart';

import 'package:call_black_line/pages/coming_soon_resources.dart';
import 'package:call_black_line/pages/donation.dart';
import 'package:call_black_line/pages/have_your_voice_heard.dart';
import 'package:call_black_line/pages/resources.dart';
import 'package:call_black_line/pages/search_resources.dart';
import 'package:call_black_line/pages/seek_help.dart';
import 'package:call_black_line/pages/use_preexisting_affirmation.dart';

import 'package:flutter/material.dart';
import 'package:call_black_line/pages/take_action.dart';
import 'package:call_black_line/pages/profile.dart';

import 'auth_methods.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  //setting up firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        //set up multiprovider
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges,
            initialData: null,
          ),
        ],
        child: MaterialApp(
            title: 'Call BlackLine',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.white,
              ),
            ),
            routes: {
              '/': (context) => const SeekHelp(),
              '/donations': (context) => const Donation(),
              '/haveYourVoiceHeard': (context) => const HaveYourVoiceHeard(),
              // '/': (context) => const CreateAffirmation(),
              '/callTextNow': (context) => const SeekHelp(),
              '/createAccount': (context) => const CreateAccount(),
              '/logIn': (context) => const LogIn(),
              '/takeAction': (context) => const TakeActionPage(),
              '/seekHelp': (context) => const SeekHelp(),
              '/profile': (context) => const Profile(),
              '/resources': (context) => const Resources(),
              '/allResources': (context) =>
                  const AllResources(title: "All Resources"),
              '/searchResources': (context) => const SearchResources(),
              '/mentalHealthResources': (context) =>
                  const AllResources(title: "Mental Health"),
              '/mutualAidResources': (context) =>
                  const AllResources(title: "Mutual Aid"),
              '/prisonerAdvocacyResources': (context) =>
                  const AllResources(title: "Prisoner Advocacy"),
              '/domesticResources': (context) => const AllResources(
                  title: "Domestic Violence & Sexual Assault"),
              '/allAffirmations': (context) =>
                  const UsePreexistingAffirmation(),
            }));
  }
}
