import 'package:call_black_line/widgets/cbl.dart';
import 'package:call_black_line/widgets/checkbox_text.dart';
import 'package:call_black_line/widgets/orange_button.dart';
import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/input_field.dart';
import 'package:call_black_line/widgets/or_divider.dart';
import 'package:call_black_line/widgets/password_field.dart';
import 'package:call_black_line/widgets/social_media_button.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool signUpTOSCheck = false;

  Color getColor(Set<MaterialState> states) {
    return Color(CBL.blue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const Header(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: CBL.padding,
          ),
          child: Column(
            children: [
              const CustomTitle(
                text: 'Create An Account',
                topPadding: 24,
                bottomPadding: 16,
              ),
              Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: CBL.fontFamily,
                    fontWeight: CBL.bold),
              ),
              InputField(
                  borderColor: CBL.primaryOrange,
                  textColor: CBL.lightGray,
                  text: 'Username',
                  icon: Icons.person),
              InputField(
                  borderColor: CBL.primaryOrange,
                  textColor: CBL.lightGray,
                  text: 'Email',
                  icon: Icons.mail),
              InputField(
                  borderColor: CBL.primaryOrange,
                  textColor: CBL.lightGray,
                  text: '+1 000 000 000',
                  icon: Icons.phone),
              PasswordField(
                  text: 'Password',
                  borderColor: CBL.primaryOrange,
                  textColor: CBL.lightGray),
              PasswordField(
                  text: 'Password Confirm',
                  borderColor: CBL.primaryOrange,
                  textColor: CBL.lightGray),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  CheckBoxText(
                    boxColor: CBL.blue,
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        text: 'By signing up you accept the ',
                        children: [
                          TextSpan(
                            text: 'Term of service and privacy policy',
                            style: TextStyle(
                              color: Color(CBL.blue),
                            ),
                          )
                        ],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: CBL.fontFamily),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: OrangeButton(
                    buttonText: 'Sign Up',
                    onTap: () => Navigator.pushNamed(context, '/callTextNow'),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              OrDivider(),
              const SizedBox(
                height: 10,
              ),
              SocialMedia(),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
