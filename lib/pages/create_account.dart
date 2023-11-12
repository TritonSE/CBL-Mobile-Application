import 'package:call_black_line/widgets/cbl.dart';
import 'package:call_black_line/widgets/checkbox_text.dart';
import 'package:call_black_line/widgets/orange_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/input_field.dart';
import 'package:call_black_line/widgets/or_divider.dart';
import 'package:call_black_line/widgets/password_field.dart';
import 'package:call_black_line/widgets/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:call_black_line/auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../testimonial.dart';
import '../user.dart';
import '../big_auth.dart';

final Uri _tosUrl =
    Uri.parse('https://www.callblackline.com/terms-of-service');

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool signUpTOSCheck = false;

  //controllers for all the fields necessary for account creation
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  // muliple controllers for same widget, should I use list of controllers instead?
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  //variables to store the values of the fields
  var _email;
  var _username;
  var _phoneNumber;
  var _password;
  Color getColor(Set<MaterialState> states) {
    return Color(CBL.blue);
  }

  Future<void> _launchTOSUrl() async {
    if (!await launchUrl(_tosUrl)) {
      throw Exception('Could not launch url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User?>();

    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
            children: [
              CustomTitle(
                text: 'Create An Account',
                topPadding: 24,
                bottomPadding: CBL.padding,
              ),
              // Text(
              //   'Sign Up',
              //   style: TextStyle(
              //       fontSize: 22,
              //       fontFamily: CBL.fontFamily,
              //       fontWeight: CBL.bold),
              // ),
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 17,
                  color: Color(CBL.primaryOrange),
                  fontFamily: CBL.fontFamily,
                  fontWeight: CBL.bold),
              ),

              InputField(
                  borderColor: CBL.black,
                  iconColor: CBL.primaryOrange,
                  textColor: CBL.lightGray,
                  text: 'Type here...',
                  icon: Icons.person,
                  titleController: _usernameController),
              Text(
                'Email',
                style: TextStyle(
                    fontSize: 17,
                    color: Color(CBL.primaryVariantOrange),
                    fontFamily: CBL.fontFamily,
                    fontWeight: CBL.bold),
              ),
              InputField(
                  borderColor: CBL.black,
                  iconColor: CBL.primaryOrange,
                  textColor: CBL.lightGray,
                  text: 'Type here...',
                  icon: Icons.mail,
                  titleController: _emailController),
              Text(
                'Phone Number',
                style: TextStyle(
                    fontSize: 17,
                    color: Color(CBL.primaryOrange),
                    fontFamily: CBL.fontFamily,
                    fontWeight: CBL.bold),
              ),
              InputField(
                  borderColor: CBL.black,
                  iconColor: CBL.primaryOrange,
                  textColor: CBL.lightGray,
                  text: 'Type here...',
                  icon: Icons.phone,
                  titleController: _phoneNumberController),
              Text(
                'Password',
                style: TextStyle(
                    fontSize: 17,
                    color: Color(CBL.primaryOrange),
                    fontFamily: CBL.fontFamily,
                    fontWeight: CBL.bold),
              ),
              PasswordField(
                  text: 'Password',
                  borderColor: CBL.black,
                  textColor: CBL.lightGray,
                  bottomPadding: 40,
                  titleController: _passwordController),
              Text(
                'Password Confirm',
                style: TextStyle(
                    fontSize: 17,
                    color: Color(CBL.primaryOrange),
                    fontFamily: CBL.fontFamily,
                    fontWeight: CBL.bold),
              ),
              PasswordField(
                  text: 'Password Confirm',
                  borderColor: CBL.black,
                  textColor: CBL.lightGray,
                  bottomPadding: 40,
                  titleController: _confirmPasswordController),
              Row(
                children: [
                  //takes care of TOS agreeement, signUpTOSCheck stores whether or not the checkbox is checked
                  CheckBoxText(
                    boxColor: CBL.primaryOrange,
                    onCheckboxChanged: (value) => {
                      setState(() {
                        signUpTOSCheck = value;
                      })
                    },
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        text: 'By signing up you accept the ',
                        children: [
                          TextSpan(
                            text: 'Term of service and privacy policy',
                            recognizer: TapGestureRecognizer()
                              ..onTap = _launchTOSUrl,
                            style: TextStyle(
                              color: Color(CBL.primaryOrange),
                            ),
                          )
                        ],
                        style: TextStyle(
                            color: Color(CBL.black),
                            fontSize: 17,
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
                    onTap: () async {
                      //make sure passwords are the same
                      if (_passwordController.text !=
                          _confirmPasswordController.text) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
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

                      //make sure terms are agreed to
                      if (signUpTOSCheck == false) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Please accept the terms of service and privacy policy"),
                          ),
                        );
                        return;
                      }

                      //sign up the user
                      final SignUpUtils signUpUtils = SignUpUtils();
                      Object result = await signUpUtils.signUp(
                          context,
                          _emailController.text,
                          _passwordController.text,
                          _usernameController.text,
                          _phoneNumberController.text);

                      //store result as an int
                      int intResult = (result.runtimeType == int) ? 400 : 0;
                      String stringResult = result.toString();

                      //if success, proceed as normal, if failure, show snackbar with error message
                      if (result == 400) {
                        Navigator.pushNamed(context, '/callTextNow');
                      } else {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(stringResult),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
