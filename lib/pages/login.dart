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

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
            return const LogInPage();
          } else if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text('Something went wrong'),
              ),
            );
          } else {
            return const LogInPage();
          }
        });
  }
}

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
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
        print("back button was pressed from take_action");
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
                text: 'Log In',
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
              Text(
                'Email',
                style: TextStyle(
                    fontSize: CBL.fieldTitleFontSize,
                    color: Color(CBL.primaryVariantOrange),
                    fontFamily: CBL.fontFamily,
                    fontWeight: CBL.bold),
              ),
              InputField(
                  borderColor: CBL.black,
                  iconColor: CBL.primaryOrange,
                  textColor: CBL.gray,
                  text: 'Type here...',
                  icon: Icons.person,
                  titleController: _emailController),
              Text(
                'Password',
                style: TextStyle(
                    fontSize: CBL.fieldTitleFontSize,
                    color: Color(CBL.primaryVariantOrange),
                    fontFamily: CBL.fontFamily,
                    fontWeight: CBL.bold),
              ),
              PasswordField(
                  text: 'Type here...',
                  borderColor: CBL.black,
                  textColor: CBL.gray,
                  bottomPadding: 16,
                  titleController: _passwordController),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CheckBoxText(
                        boxColor: CBL.primaryOrange,
                        onCheckboxChanged: (value) => {},
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
                    onTap: () async {
                      String snackBarText = "";

                      if (!EmailValidator.validate(_emailController.text)) {
                        snackBarText = "Error: Please enter a valid email.";
                      } else {
                        snackBarText =
                        'Password reset email sent to: ${_emailController.text}';
                        await context
                            .read<AuthenticationService>()
                            .resetPassword(email: _emailController.text);
                      }
                      final snackBar = SnackBar(
                        content: Text(snackBarText),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
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
                height: CBL.largePadding,
              ),
              Padding(padding: const EdgeInsets.only(left: 0, right: 0),
                child:
                SizedBox(
                  height: CBL.boxHeight,
                  //width: 325,
                  child: GestureDetector(
                    // onTap: () =>
                    //     Navigator.pushNamed(context, '/logIn'),
                    onTap: () async {
                      Future<Object> result = context
                          .read<AuthenticationService>()
                          .signIn(
                          email: _emailController.text,
                          password: _passwordController.text);

                      Object returnedObject = await result;
                      int returnedStatus =
                      (returnedObject.runtimeType == int) ? 400 : 0;

                      //print(firebaseuser!.email);

                      if (returnedStatus == 400) {
                        Navigator.pushNamed(context, '/callTextNow');
                      } else {
                        String returnedMessage = returnedObject.toString();
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(returnedMessage),
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
                          'Sign Up',
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

              // Align(
              //   alignment: Alignment.centerRight,
              //   child: OrangeButton(
              //     buttonText: 'Sign In',
              //     onTap: () async {
              //       Future<Object> result = context
              //           .read<AuthenticationService>()
              //           .signIn(
              //           email: _emailController.text,
              //           password: _passwordController.text);
              //
              //       Object returnedObject = await result;
              //       int returnedStatus =
              //       (returnedObject.runtimeType == int) ? 400 : 0;
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




            ],
          ),
        ),
      ),
    );
  }
}
