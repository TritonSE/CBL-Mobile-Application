import 'package:call_black_line/pages/call_text_now.dart';
import 'package:call_black_line/pages/create_account.dart';
import 'package:call_black_line/pages/create_affirmation.dart';
import 'package:call_black_line/pages/seek_help.dart';

import 'package:flutter/material.dart';
import 'package:call_black_line/pages/take_action.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/rounded_button_image.dart';
import 'package:call_black_line/pages/call_text_now.dart';
import 'package:call_black_line/pages/seek_help.dart';

import 'auth_methods.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:call_black_line/widgets/cbl.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
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
              '/': (context) => const MyHomePage(title: 'Call BlackLine'),
              // '/': (context) => const Donation(),
              // '/': (context) => const HaveYourVoiceHeard(),
              // '/': (context) => const CreateAffirmation(),
              '/callTextNow': (context) => const CallTextNow(),
              '/createAccount': (context) => const CreateAccount(),
              '/takeAction': (context) => const TakeActionPage(),
            }));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final firebaseuser = context.watch<User?>();

    debugPrint(firebaseuser.toString());

    if (firebaseuser == null) {
      return const SeekHelp();
    } else {
      return const CallTextNow();
    }
  }
}
