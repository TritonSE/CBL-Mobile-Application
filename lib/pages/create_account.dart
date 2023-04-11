import 'package:call_black_line/widgets/checkbox_text.dart';
import 'package:call_black_line/widgets/orange_button.dart';
import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/input_field.dart';
import 'package:call_black_line/widgets/or_divider.dart';
import 'package:call_black_line/widgets/password_field.dart';
import 'package:call_black_line/widgets/social_media_button.dart';

import 'package:call_black_line/auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../testimonial.dart';
import '../user.dart';
import '../big_auth.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool signUpTOSCheck = false;

  int primaryOrange = int.parse('#DF742C'.replaceAll('#', '0xff'));
  int neutralGray = int.parse('#6C6C6C'.replaceAll('#', '0xff'));
  int veryLightGray = int.parse('#D8D8D8'.replaceAll('#', '0xff'));
  int fbBlue = int.parse('#4267B2'.replaceAll('#', '0xff'));
  int googleGreen = int.parse('#0F9D58'.replaceAll('#', '0xff'));
  int createBlue = int.parse('#428BCD'.replaceAll('#', '0xff'));
  int haveAccountGray = int.parse('#ABA1A1'.replaceAll('#', '0xff'));
  int blue = int.parse('#66A0F5'.replaceAll('#', '0xff'));
  int lightGray = int.parse('#B4B4B4'.replaceAll('#', '0xff'));

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  // muliple controllers for same widget, should I use list of controllers instead?
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  var _email;
  var _username;
  var _phoneNumber;
  var _password;

  Color getColor(Set<MaterialState> states) {
    return Color(blue);
  }

  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User?>();

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const Header(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              const CustomTitle(
                text: 'Create An Account',
                topPadding: 24,
                bottomPadding: 16,
              ),
              const Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500),
              ),
              InputField(
                  borderColor: primaryOrange,
                  textColor: lightGray,
                  text: 'Username',
                  icon: Icons.person,
                  titleController: _usernameController),
              InputField(
                  borderColor: primaryOrange,
                  textColor: lightGray,
                  text: 'Email',
                  icon: Icons.mail,
                  titleController: _emailController),
              InputField(
                  borderColor: primaryOrange,
                  textColor: lightGray,
                  text: '+1 000 000 000',
                  icon: Icons.phone,
                  titleController: _phoneNumberController),
              PasswordField(
                  text: 'Password',
                  borderColor: primaryOrange,
                  textColor: lightGray,
                  titleController: _passwordController),
              PasswordField(
                  text: 'Password Confirm',
                  borderColor: primaryOrange,
                  textColor: lightGray,
                  titleController: _confirmPasswordController),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  CheckBoxText(
                    boxColor: blue,
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        text: 'By signing up you accept the ',
                        children: [
                          TextSpan(
                            text: 'Term of service and privacy policy',
                            style: TextStyle(
                              color: Color(blue),
                            ),
                          )
                        ],
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter'),
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
                    onTap: () async {
                      if (_passwordController.text !=
                          _confirmPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Passwords do not match'),
                          ),
                        );
                        return;
                      }
                      setState(() {
                        _email = _emailController.text;
                        _username = _usernameController.text;
                        _phoneNumber = _phoneNumberController.text;
                        _password = _passwordController.text;
                      });

                      print('Sign Up Button Pressed');
                      final SignUpUtils signUpUtils = SignUpUtils();
                      signUpUtils.signUp(
                          context,
                          _emailController.text,
                          _passwordController.text,
                          _usernameController.text,
                          _phoneNumberController.text);
                      print("completed");
                      Navigator.pushNamed(context, '/callTextNow');
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              OrDivider(veryLightGray: veryLightGray),
              const SizedBox(
                height: 10,
              ),
              SocialMedia(fbBlue: fbBlue, googleGreen: googleGreen),
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
