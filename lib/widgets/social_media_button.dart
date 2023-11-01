import 'package:call_black_line/widgets/cbl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import '../auth_methods.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.of(context).size.width;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final FacebookLogin facebookLogin = FacebookLogin();

    return Flex(
      direction:
          mediaWidth < CBL.smallMediaWidth ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          //width: 325,
          height: 57,
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(CBL.gray),
                  width: 1.5,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(24),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x2b000000),
                    offset: Offset(
                      0,
                      2,
                    ),
                    blurRadius: 3,
                    spreadRadius: 0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: CBL.padding, right: CBL.paddingRight),
                      child: SizedBox(
                        height: CBL.socialMediaLogoSize,
                        width: CBL.socialMediaLogoSize,
                        child: Image.asset(
                          'assets/images/google.png',
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      child: Text(
                        'Continue with Google',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: CBL.fontSize,
                          fontFamily: CBL.fontFamily,
                          fontWeight: FontWeight.w600,
                          color: const Color(CBL.gray),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () async {
              User? user = await context
                  .read<AuthenticationService>()
                  .signInWithFacebook(context: context);

              if (user != null) {
                Navigator.pushNamed(context, '/callTextNow');
              }
            },
          ),
        ),
        SizedBox(
          height: CBL.padding,
        ),
        SizedBox(
          //width: 325,
          height: 57,
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(CBL.gray),
                  width: 1.5,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(24),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x2b000000),
                    offset: Offset(
                      0,
                      2,
                    ),
                    blurRadius: 3,
                    spreadRadius: 0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: CBL.padding, right: CBL.paddingRight),
                      child: SizedBox(
                        height: CBL.socialMediaLogoSize,
                        width: CBL.socialMediaLogoSize,
                        child: Image.asset(
                          'assets/images/facebook.png',
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    child: Text(
                      'Continue with Facebook',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: CBL.fontSize,
                        fontFamily: CBL.fontFamily,
                        fontWeight: FontWeight.w600,
                        color: const Color(CBL.gray),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () async {
              //sign in or sign up with google
              UserCredential? userCred = await context
                  .read<AuthenticationService>()
                  .altSignInWithGoogle();
              print("In social media button, user is $userCred");

              if (userCred != null) {
                Navigator.pushNamed(context, '/callTextNow');
              }
            },
          ),
        ),
      ],
    );
  }
}
