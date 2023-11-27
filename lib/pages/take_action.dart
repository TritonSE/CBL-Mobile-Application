import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/or_divider.dart';
import 'package:call_black_line/widgets/social_media_button.dart';
import '../widgets/cbl.dart';

import 'package:firebase_auth/firebase_auth.dart';

class TakeActionWrapper extends StatefulWidget {
  const TakeActionWrapper({super.key});

  @override
  State<TakeActionWrapper> createState() => _TakeActionWrapperState();
}

class _TakeActionWrapperState extends State<TakeActionWrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasData) {
            return const TakeActionPage();
          } else if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text('Something went wrong'),
              ),
            );
          } else {
            return const TakeActionPage();
          }
        });
  }
}

class TakeActionPage extends StatefulWidget {
  const TakeActionPage({super.key});

  @override
  State<TakeActionPage> createState() => _TakeActionPageState();
}

class _TakeActionPageState extends State<TakeActionPage> {
  bool passwordCheck = true;
  int veryLightGray = 0xffD8D8D8;
  int createBlue = 0xff428BCD;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(onBackButtonPressed: () {
        Navigator.pushNamed(context, '/seekHelp');
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: CBL.padding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitle(
                text: 'Take Action Now',
                topPadding: 24.5,
                bottomPadding: CBL.padding,
              ),
              const SizedBox(
                height: 40,
              ),
              const SocialMedia(),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: CBL.boxHeight,
                //width: 325,
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/logIn'),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24),
                      ),
                      color: Color(CBL.primaryOrange),
                    ),
                    child: Center(
                      child: Text(
                        'Log In',
                        style: TextStyle(
                            fontSize: CBL.fontSize,
                            fontFamily: CBL.fontFamily,
                            fontWeight: CBL.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              OrDivider(),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.only(top: CBL.padding),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          color: Color(CBL.textGray),
                          fontFamily: CBL.fontFamily,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, '/createAccount'),
                        child: Text(
                          "Create new one",
                          style: TextStyle(
                            color: Color(CBL.primaryOrange),
                            fontFamily: CBL.fontFamily,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
