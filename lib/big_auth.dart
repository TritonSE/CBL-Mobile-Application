// This file contains the main functions for signing up and deleting the account.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user.dart';
import 'auth_methods.dart';

//data type for user data with password
class UserDataWPassword {
  final String username;
  final String phoneNumber;
  final String email;
  final String password;

  UserDataWPassword(
      {required this.username,
      required this.phoneNumber,
      required this.email,
      required this.password});

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password
    };
  }
}

class SignUpUtils {
  //utility class for database side
  final UserRepository userRepository = UserRepository();

  Future<Object> signUp(BuildContext context, String email, String password,
      String username, String phoneNumber) async {
    try {
      //trying to create the account
      Future<Object> result = context
          .read<AuthenticationService>()
          .signUp(email: email, password: password);

      //getting the result
      Object returnedObject = await result;
      int returnedStatus = (returnedObject.runtimeType == int) ? 400 : 0;

      //no issues with authentication side, proceed to database side
      if (returnedStatus == 400) {
        //if successful, add the user to the database
        UserRepository userRepository = UserRepository();

        //get the current user's uid
        final User firebaseuser = FirebaseAuth.instance.currentUser!;
        String uid = firebaseuser.email!;

        //add the user to the database
        UserData user = UserData(
            username: username, phoneNumber: phoneNumber, email: email);
        userRepository.addUser(user, uid);

        return 400;
      } else {
        return returnedObject.toString();
      }
    } catch (e) {
      return {'status': 'ERROR', 'message': e.toString()};
    }
  }

  Future<Object> signUpGoogle(BuildContext context) async {
    try {
      UserRepository userRepository = UserRepository();
      UserCredential? result =
          await context.read<AuthenticationService>().signInWithGoogle();

      if (result == null) {
        return 0;
      } else {
        //get the current user's uid
        final User firebaseuser = FirebaseAuth.instance.currentUser!;
        String uid = firebaseuser.email!;

        // Check if the user is new or existing
        bool isNewUser = result.additionalUserInfo!.isNewUser;

        if (isNewUser) {
          // This means a new account was created
          // Add the user to the database
          UserData user = UserData(
              username: firebaseuser.email!.split("@")[0],
              phoneNumber: "0000000000",
              email: firebaseuser.email!);

          userRepository.addUser(user, uid);
        }

        return 400;
      }
    } catch (e) {
      return {'status': 'ERROR', 'message': e.toString()};
    }
  }

  Future<Object> signUpApple(BuildContext context) async {
    try {
      UserRepository userRepository = UserRepository();
      UserCredential? result =
          await context.read<AuthenticationService>().signInWithApple();

      if (result == null) {
        return 0;
      } else {
        //get the current user's uid
        final User firebaseuser = FirebaseAuth.instance.currentUser!;
        String uid = firebaseuser.email!;

        // Check if the user is new or existing
        bool isNewUser = result.additionalUserInfo!.isNewUser;

        if (isNewUser) {
          // This means a new account was created
          // Add the user to the database
          UserData user = UserData(
              username: firebaseuser.email!.split("@")[0],
              phoneNumber: "0000000000",
              email: firebaseuser.email!);

          userRepository.addUser(user, uid);
        }

        return 400;
      }
    } catch (e) {
      return {'status': 'ERROR', 'message': e.toString()};
    }
  }
}

/**

UserRepository userRepository = UserRepository();
User user = User(name: 'John Doe', Phone Number: 8583165432, email: 'johndoe@example.com');
userRepository.addUser(user);

This code creates an instance of UserRepository and User,
and adds the user to the collection 
by calling the addUser method of the repository.
 */
