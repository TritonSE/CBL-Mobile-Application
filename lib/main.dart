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
import 'package:call_black_line/pages/call_text_now.dart';

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
          title: 'Call Blackline',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.white,
            ),
          ),
          routes: {
            // '/': (context) => const SeekHelp(),

            '/callTextNow': (context) => const CallTextNow(),
            '/createAccount': (context) => const CreateAccount(),
            '/takeAction': (context) => const TakeActionPage(),
            '/donation': (context) => const Donation(),
            '/affirmation': (context) => const Affirmation(),
            '/seekHelp': (context) => const SeekHelp(),
          },
          home: const MyHomePage(title: 'Call Blackline'),
        ));
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

class SeekHelp extends StatelessWidget {
  const SeekHelp({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User?>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavBar(
        currentPage: 'Seek Help',
      ), //Available: Resources, Seek Help, Profile
      appBar: Header(
        isHome: true,
        onBackButtonPressed: () {
          print("back button was pressed");
        },
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
