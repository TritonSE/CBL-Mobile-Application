import 'package:call_black_line/widgets/cbl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../auth_methods.dart';

class SocialMedia extends StatelessWidget {
  int fbBlue = 0xff4267B2;
  int googleGreen = 0xff0F9D58;

  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.of(context).size.width;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    return Flex(
      direction: mediaWidth < 390 ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 176,
          height: 48,
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(fbBlue),
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 14.5),
                    child: Image.asset(
                      'assets/images/facebook.png',
                    ),
                  ),
                  Center(
                    child: Text(
                      'Facebook',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: CBL.fontFamily,
                        fontWeight: CBL.bold,
                        color: Color(fbBlue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              print("you clicked me");
            },
          ),
        ),
        SizedBox(
          width: 176,
          height: 48,
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(googleGreen),
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 14.5),
                    child: Image.asset(
                      'assets/images/google.png',
                    ),
                  ),
                  Center(
                    child: Text(
                      'Google',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: CBL.fontFamily,
                        fontWeight: CBL.bold,
                        color: Color(googleGreen),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () async {
              //sign in or sign up with google
              User? user = await context
                  .read<AuthenticationService>()
                  .signInWithGoogle(context: context);

              if (user != null) {
                Navigator.pushNamed(context, '/callTextNow');
              }
            },
          ),
        ),
      ],
    );
  }
}
