import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';

/// Help used:
/// https://www.youtube.com/watch?v=4vKiJZNPhss
/// https://youtu.be/4vKiJZNPhss

class AuthenticationService {
  //Entry point of Firebase Authentication SDk
  final FirebaseAuth _firebaseAuth;

  //Constructor
  AuthenticationService(this._firebaseAuth);

  //Listens in on changes to the user's sign in state
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  /// Signs in with email and password
  Future<Object> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return HttpStatus.badRequest;
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  /// Signs up with email and password
  Future<Object> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return HttpStatus.badRequest;
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  /// Sends a password reset email
  Future<Object> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return HttpStatus.badRequest;
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  /// Signs out
  Future<Object> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return HttpStatus.badRequest;
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }
}
