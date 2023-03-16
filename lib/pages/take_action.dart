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
import '../widgets/cbl.dart';

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
    var mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Header(),
      bottomNavigationBar: const CustomNavBar(currentPage: 'Resources'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: CBL.padding,
          ),
          child: Column(
            children: [
              const CustomTitle(
                text: 'Take Action Now',
                topPadding: 24.5,
                bottomPadding: 16,
              ),
              Text(
                'Login',
                style: TextStyle(
                    fontWeight: CBL.bold,
                    fontSize: 22,
                    fontFamily: CBL.fontFamily),
              ),
              const SizedBox(
                height: 24,
              ),
              InputField(
                  borderColor: CBL.primaryOrange,
                  textColor: CBL.lightGray,
                  text: 'Username',
                  icon: Icons.person),
              PasswordField(
                  text: 'Password',
                  borderColor: CBL.primaryOrange,
                  textColor: CBL.lightGray),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CheckBoxText(
                        boxColor: CBL.blue,
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          fontFamily: CBL.fontFamily,
                          fontSize: 15,
                          fontWeight: CBL.bold,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: Color(CBL.lightGray),
                        fontFamily: CBL.fontFamily,
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
              OrDivider(),
              const SizedBox(
                height: 12,
              ),
              SocialMedia(),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Center(
                  child: Flex(
                    direction:
                        mediaWidth < 380 ? Axis.vertical : Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          color: Color(veryLightGray),
                          fontFamily: CBL.fontFamily,
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
