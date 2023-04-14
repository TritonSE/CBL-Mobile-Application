import 'package:call_black_line/widgets/orange_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:call_black_line/auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class Donation extends StatelessWidget {
  const Donation({super.key});

  @override
  Widget build(BuildContext context) {
    bool shouldRedirect = true;
    BuildContext dialogContext;

    final firebaseuser = context.watch<User?>();

    int textGray = int.parse('#909090'.replaceAll('#', '0xff'));
    int textBlack = int.parse('#111827'.replaceAll('#', '0xff'));
    int blue = int.parse('#66A0F5'.replaceAll('#', '0xff'));

    Future<void> _launchUrl(String url) async {
      final Uri uri = Uri(scheme: "https", host: url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch url');
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(onBackButtonPressed: () {
        print("back button was pressed from donation");
        Navigator.pushNamed(context, '/callTextNow');
      }),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            const CustomTitle(text: 'Donation'),
            const SizedBox(
              width: 266,
              child: Text(
                'Your support will ensure that someone hurting has someone to talk to.',
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            TextButton(
              onPressed: () => {
                shouldRedirect = true,
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) {
                      dialogContext = context;
                      return Dialog(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 46, right: 46, top: 44, bottom: 59),
                          child: Container(
                            width: 266,
                            height: 282,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Before you go...',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    color: Color(textBlack),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.orange),
                                ),
                                const SizedBox(height: 32),
                                Text(
                                  'You are being redirected to the Call BlackLine website’s donation page!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    color: Color(textBlack),
                                  ),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                Flexible(
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text:
                                          'Want to stay on the app? Click here to ',
                                      children: [
                                        TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              shouldRedirect = false;
                                              Navigator.pop(dialogContext);
                                            },
                                          text: 'cancel.',
                                          style: TextStyle(
                                            color: Color(blue),
                                          ),
                                        )
                                      ],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Inter'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                Future.delayed(const Duration(milliseconds: 2000), () {
                  if (shouldRedirect) {
                    _launchUrl('www.google.com');
                  }
                }),
              },
              child: const OrangeButton(
                buttonText: 'Donate',
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 266,
              child: Text(
                'Call BlackLine is a non-profit, tax-exempt corporation recognized under Section 501(c)(3) of the Internal Revenue Code.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: Color(textGray),
                ),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Container(
              height: 231,
              width: 358,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/placeholder.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
