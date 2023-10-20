import 'package:call_black_line/widgets/cbl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
              try {
                // Trigger the authentication flow
                final GoogleSignInAccount? googleSignInAccount =
                    await googleSignIn.signIn();

                if (googleSignInAccount != null) {
                  Navigator.pushNamed(context, '/callTextNow');
                }

                // Obtain the auth details from the request
                if (googleSignInAccount != null) {
                  final GoogleSignInAuthentication googleSignInAuthentication =
                      await googleSignInAccount.authentication;

                  final AuthCredential credential =
                      GoogleAuthProvider.credential(
                    accessToken: googleSignInAuthentication.accessToken,
                    idToken: googleSignInAuthentication.idToken,
                  );

                  final UserCredential authResult =
                      await _auth.signInWithCredential(credential);
                  final User? user = authResult.user;

                  if (user != null &&
                      !user.isAnonymous &&
                      await user.getIdToken() != null) {
                    Navigator.pushNamed(context, '/callTextNow');
                  }
                }
              } catch (error) {
                print(error);
                return null;
              }
            },
          ),
        ),
      ],
    );
  }
}
