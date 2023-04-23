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
  final TextEditingController _usernameController = TextEditingController();

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
            children: [
              CustomTitle(
                text: 'Take Action Now',
                topPadding: 24.5,
                bottomPadding: CBL.padding,
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
                  icon: Icons.person,
                  titleController: _usernameController),
              PasswordField(
                  text: 'Password',
                  borderColor: CBL.primaryOrange,
                  textColor: CBL.lightGray,
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
              Align(
                alignment: Alignment.centerRight,
                child: OrangeButton(
                  buttonText: 'Sign In',
                  onTap: () async {
                    //once we can get input from the user, replace this with user input
                    Future<Object> result = context
                        .read<AuthenticationService>()
                        .signIn(
                            email: _usernameController.text,
                            password: _passwordController.text);

                    Object returnedObject = await result;
                    int returnedStatus =
                        (returnedObject.runtimeType == int) ? 400 : 0;

                    //print(firebaseuser!.email);

                    if (returnedStatus == 400) {
                      Navigator.pushNamed(context, '/callTextNow');
                    } else {
                      String returnedMessage = returnedObject.toString();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(returnedMessage),
                        ),
                      );
                    }
                  },
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
