import 'package:call_black_line/widgets/checkbox_text.dart';
import 'package:call_black_line/widgets/custom_navbar.dart';
import 'package:call_black_line/widgets/orange_button.dart';
import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/input_field.dart';
import 'package:call_black_line/widgets/password_field.dart';
import 'package:call_black_line/widgets/or_divider.dart';
import 'package:call_black_line/widgets/social_media_button.dart';

class TakeActionPage extends StatefulWidget {
  const TakeActionPage({super.key});

  @override
  State<TakeActionPage> createState() => _TakeActionPageState();
}

class _TakeActionPageState extends State<TakeActionPage> {
  bool passwordCheck = true;
  int primaryOrange = int.parse('#DF742C'.replaceAll('#', '0xff'));
  int neutralGray = int.parse('#6C6C6C'.replaceAll('#', '0xff'));
  int veryLightGray = int.parse('#D8D8D8'.replaceAll('#', '0xff'));
  int fbBlue = int.parse('#4267B2'.replaceAll('#', '0xff'));
  int googleGreen = int.parse('#0F9D58'.replaceAll('#', '0xff'));
  int createBlue = int.parse('#428BCD'.replaceAll('#', '0xff'));
  int haveAccountGray = int.parse('#ABA1A1'.replaceAll('#', '0xff'));
  int blue = int.parse('#66A0F5'.replaceAll('#', '0xff'));
  int lightGray = int.parse('#B4B4B4'.replaceAll('#', '0xff'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Header(),
      bottomNavigationBar: CustomNavBar(currentPage: 'Resources'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              const CustomTitle(
                text: 'Take Action Now',
                topPadding: 24.5,
                bottomPadding: 16,
              ),
              const Text(
                'Login',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    fontFamily: 'Inter'),
              ),
              const SizedBox(
                height: 24,
              ),
              InputField(
                  borderColor: primaryOrange,
                  textColor: lightGray,
                  text: 'Username',
                  icon: Icons.person),
              PasswordField(
                  text: 'Password',
                  borderColor: primaryOrange,
                  textColor: lightGray),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CheckBoxText(
                        boxColor: blue,
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: Color(lightGray),
                        fontFamily: 'Inter',
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: OrangeButton(
                  buttonText: 'Sign In',
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              OrDivider(veryLightGray: veryLightGray),
              const SizedBox(
                height: 12,
              ),
              SocialMedia(fbBlue: fbBlue, googleGreen: googleGreen),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          color: Color(veryLightGray),
                          fontFamily: 'Inter',
                          fontSize: 17,
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, '/createAccount'),
                        child: Text(
                          "Create new one",
                          style: TextStyle(
                            color: Color(createBlue),
                            fontFamily: 'Inter',
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
