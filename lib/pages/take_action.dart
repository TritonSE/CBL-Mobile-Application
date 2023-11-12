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
import 'package:email_validator/email_validator.dart';

import 'package:call_black_line/auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class TakeActionWrapper extends StatefulWidget {
  const TakeActionWrapper({super.key});

  @override
  State<TakeActionWrapper> createState() => _TakeActionWrapperState();
}

class _TakeActionWrapperState extends State<TakeActionWrapper> {
  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User?>();

    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasData) {
            return const TakeActionPage();
          } else if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text('Something went wrong'),
              ),
            );
          } else {
            return const TakeActionPage();
          }
        });
  }
}

class TakeActionPage extends StatefulWidget {
  const TakeActionPage({super.key});

  @override
  State<TakeActionPage> createState() => _TakeActionPageState();
}

class _TakeActionPageState extends State<TakeActionPage> {
  bool passwordCheck = true;
  int veryLightGray = 0xffD8D8D8;
  int createBlue = 0xff428BCD;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User?>();

    var mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
                text: 'Take Action Now',
                topPadding: 24.5,
                bottomPadding: CBL.padding,
              ),
              // Text(
              //   'Login',
              //   style: TextStyle(
              //       fontWeight: CBL.bold,
              //       fontSize: 22,
              //       fontFamily: CBL.fontFamily),
              // ),
              const SizedBox(
                height: 40,
              ),
              // InputField(
              //     borderColor: CBL.primaryOrange,
              //     iconColor: CBL.primaryOrange,
              //     textColor: CBL.lightGray,
              //     text: 'Email',
              //     icon: Icons.person,
              //     titleController: _emailController),
              // PasswordField(
              //     text: 'Password',
              //     borderColor: CBL.primaryOrange,
              //     textColor: CBL.lightGray,
              //     titleController: _passwordController),
              // const SizedBox(
              //   height: 8,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Row(
              //       children: [
              //         CheckBoxText(
              //           boxColor: CBL.blue,
              //           onCheckboxChanged: (value) => {},
              //         ),
              //         Text(
              //           'Remember me',
              //           style: TextStyle(
              //             fontFamily: CBL.fontFamily,
              //             fontSize: 15,
              //             fontWeight: CBL.bold,
              //           ),
              //         ),
              //       ],
              //     ),
              //     GestureDetector(
              //       onTap: () async {
              //         String snackBarText = "";
              //
              //         if (!EmailValidator.validate(_emailController.text)) {
              //           snackBarText = "Error: Please enter a valid email.";
              //         } else {
              //           snackBarText =
              //               'Password reset email sent to: ${_emailController.text}';
              //           await context
              //               .read<AuthenticationService>()
              //               .resetPassword(email: _emailController.text);
              //         }
              //         final snackBar = SnackBar(
              //           content: Text(snackBarText),
              //         );
              //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //       },
              //       child: Text(
              //         "Forgot Password",
              //         style: TextStyle(
              //           color: Color(CBL.lightGray),
              //           fontFamily: CBL.fontFamily,
              //           fontSize: 15,
              //         ),
              //       ),
              //     )
              //   ],
              // ),

              SocialMedia(),
              const SizedBox(
                height: 24,
              ),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: OrangeButton(
              //     buttonText: 'Sign In',
              //     onTap: () async {
              //       Future<Object> result = context
              //           .read<AuthenticationService>()
              //           .signIn(
              //               email: _emailController.text,
              //               password: _passwordController.text);
              //
              //       Object returnedObject = await result;
              //       int returnedStatus =
              //           (returnedObject.runtimeType == int) ? 400 : 0;
              //
              //       //print(firebaseuser!.email);
              //
              //       if (returnedStatus == 400) {
              //         Navigator.pushNamed(context, '/callTextNow');
              //       } else {
              //         String returnedMessage = returnedObject.toString();
              //         ScaffoldMessenger.of(context).hideCurrentSnackBar();
              //         ScaffoldMessenger.of(context).showSnackBar(
              //           SnackBar(
              //             content: Text(returnedMessage),
              //           ),
              //         );
              //       }
              //     },
              //   ),
              // ),
              SizedBox(
                height: CBL.boxHeight,
                width: 325,
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, '/logIn'),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24),
                      ),
                      color: Color(CBL.primaryOrange),
                    ),
                    child: Center(
                      child: Text(
                        'Log In',
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

              const SizedBox(
                height: 12,
              ),
              OrDivider(),
              const SizedBox(
                height: 12,
              ),

              Padding(
                padding: EdgeInsets.only(top: CBL.padding),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // direction:
                    //     mediaWidth < 380 ? Axis.vertical : Axis.horizontal,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          color: Color(CBL.textGray),
                          fontFamily: CBL.fontFamily,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, '/createAccount'),
                        child: Text(
                          "Create new one",
                          style: TextStyle(
                            color: Color(CBL.primaryOrange),
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
