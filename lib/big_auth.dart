// This file contains the main functions for signing up and deleting the account.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user.dart';
import 'auth_methods.dart';

class UserDataWPassword {
  final String username;
  final int phoneNumber;
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
  final UserRepository userRepository = UserRepository();
  Future<Object> signUp(BuildContext context, String email, String password,
      String username, String phoneNumber) async {
    try {
      Future<Object> result = context
          .read<AuthenticationService>()
          .signIn(email: email, password: password);
      if (await result == 400) {
        // UserData userData = UserData(
        //     username: username, phoneNumber: phoneNumber, email: email);
        //userRepository.addUser(userData);
        return 400;
      }
    } catch (e) {
      return {'status': 'ERROR', 'message': e.toString()};
    }
    throw {
      {'status': 'ERROR', 'message': 'Something went wrong.'}
    };
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
