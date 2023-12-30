import 'dart:io';

import 'package:call_black_line/widgets/cbl.dart';
import 'package:flutter/material.dart';

import '../big_auth.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Sign in with Google
        GestureDetector(
          child: SizedBox(
            height: 57,
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
          ),
          onTap: () async {
            //sign in or sign up with google
            final SignUpUtils signUpUtils = SignUpUtils();
            Object result = await signUpUtils.signUpGoogle(context);

            if (result == 400) {
              Navigator.pushNamed(context, '/callTextNow');
            }
          },
        ),
        // Sign in with Apple (required to be on the App Store)
        if (Platform.isIOS) const SizedBox(height: 24),
        if (Platform.isIOS)
          GestureDetector(
            child: SizedBox(
              height: 57,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(CBL.black),
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
                      color: Colors.black,
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
                            'assets/images/apple.png',
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        child: Text(
                          'Continue with Apple',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: CBL.fontSize,
                            fontFamily: CBL.fontFamily,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () async {
              //sign in or sign up with google
              final SignUpUtils signUpUtils = SignUpUtils();
              Object result = await signUpUtils.signUpApple(context);

              if (result == 400) {
                Navigator.pushNamed(context, '/callTextNow');
              }
            },
          )
      ],
    );
  }
}
