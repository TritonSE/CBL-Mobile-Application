// This file contains the main functions for signing up and deleting the account.

import 'package:cloud_firestore/cloud_firestore.dart';
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
        String uid = firebaseuser.uid;

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

  Future<Object> deleteAccount(BuildContext context, String id) async {
    try {
      int result = context
          .read<AuthenticationService>()
          .signIn(email: "shreya112358@gmail.com", password: "7654321") as int;

      if (result == 400) {
        userRepository.deleteUser(id);
        return 400;
      }
    } catch (e) {
      return {'status': 'ERROR', 'message': e.toString()};
    }
    return 400;
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
