import 'package:call_black_line/widgets/cbl.dart';
import 'package:call_black_line/widgets/checkbox_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/input_field.dart';
import 'package:call_black_line/widgets/password_field.dart';
import 'package:url_launcher/url_launcher.dart';

import '../big_auth.dart';

final Uri _tosUrl = Uri.parse('https://www.callblackline.com/terms-of-service');

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitle(
                text: 'Create An Account',
                topPadding: 24,
                bottomPadding: CBL.padding,
              ),
              Text(
                'Name',
                style: TextStyle(
                    fontSize: CBL.fieldTitleFontSize,
                    color: Color(CBL.primaryOrange),
                    fontFamily: CBL.fontFamily,
                    fontWeight: CBL.bold),
                textAlign: TextAlign.left,
              ),
              InputField(
                  borderColor: CBL.black,
                  iconColor: CBL.primaryOrange,
                  textColor: CBL.gray,
                  text: 'Type here...',
                  icon: Icons.person,
                  titleController: _usernameController),
              Text(
                'Email',
                style: TextStyle(
                    fontSize: CBL.fieldTitleFontSize,
                    color: Color(CBL.primaryVariantOrange),
                    fontFamily: CBL.fontFamily,
                    fontWeight: CBL.bold),
                textAlign: TextAlign.left,
              ),
              InputField(
                  borderColor: CBL.black,
                  iconColor: CBL.primaryOrange,
                  textColor: CBL.gray,
                  text: 'Type here...',
                  icon: Icons.mail,
                  titleController: _emailController),
              Text(
                'Phone Number',
                style: TextStyle(
                    fontSize: CBL.fieldTitleFontSize,
                    color: Color(CBL.primaryOrange),
                    fontFamily: CBL.fontFamily,
                    fontWeight: CBL.bold),
                textAlign: TextAlign.left,
              ),
              InputField(
                  borderColor: CBL.black,
                  iconColor: CBL.primaryOrange,
                  textColor: CBL.gray,
                  text: 'Type here...',
                  icon: Icons.phone,
                  titleController: _phoneNumberController),
              Text(
                'Password',
                style: TextStyle(
                    fontSize: CBL.fieldTitleFontSize,
                    color: Color(CBL.primaryOrange),
                    fontFamily: CBL.fontFamily,
                    fontWeight: CBL.bold),
              ),
              PasswordField(
                  text: 'Type here...',
                  borderColor: CBL.black,
                  textColor: CBL.gray,
                  bottomPadding: 40,
                  titleController: _passwordController),
              Text(
                'Password Confirm',
                style: TextStyle(
                    fontSize: CBL.fieldTitleFontSize,
                    color: Color(CBL.primaryOrange),
                    fontFamily: CBL.fontFamily,
                    fontWeight: CBL.bold),
              ),
              PasswordField(
                  text: 'Type here...',
                  borderColor: CBL.black,
                  textColor: CBL.gray,
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
                            fontSize: CBL.fieldTitleFontSize,
                            fontWeight: FontWeight.w400,
                            fontFamily: CBL.fontFamily),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: CBL.largePadding,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: SizedBox(
                  height: CBL.boxHeight,
                  //width: 325,
                  child: GestureDetector(
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

                      List<String> inputs = [
                        _emailController.text,
                        _usernameController.text,
                        _phoneNumberController.text,
                        _passwordController.text
                      ];

                      bool anyInputsEmpty =
                          inputs.any((element) => element.isEmpty);

                      if (anyInputsEmpty) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill out all fields'),
                          ),
                        );
                        return;
                      }

                      //make sure terms are agreed to
                      if (signUpTOSCheck == false) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(24),
                        ),
                        color: Color(CBL.primaryOrange),
                      ),
                      child: Center(
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                              fontSize: CBL.fontSize,
                              fontFamily: CBL.fontFamily,
                              fontWeight: CBL.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: CBL.largePadding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
