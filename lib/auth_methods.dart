import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
// import '/user.dart' as users;

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
      return 400;
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  /// Signs up with email and password
  Future<Object> signUp(
      {required String email, required String password}) async {
    try {
      UserCredential us = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // users.User user = users.User(username: "", phoneNumber: 0, email: email);
      // users.UserRepository().addUser(user);
      return 400;
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  /// Sends a password reset email
  Future<Object> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return 400;
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  /// Signs out
  Future<Object> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return 400;
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    print("Got here");
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
        print(user);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          return null;
        } else if (e.code == 'invalid-credential') {
          return null;
        }
      } catch (e) {
        return null;
      }
    }

    return user;
  }

  Future<UserCredential?> altSignInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      print(gUser);
      print("Got here");
      if (gUser == null) {
        // User cancelled the sign-in
        return null;
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      print(gAuth);
      print("Got here");

      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      // Handle the error, e.g., by showing an error message to the user
      print('Error during Google sign-in: $e');
      return null;
    }
  }

  Future<User?> signInWithFacebook(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final FacebookLogin facebookLogin = FacebookLogin();

    final FacebookLoginResult result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.success:
        final FacebookAccessToken facebookAccessToken = result.accessToken;
        final AuthCredential credential =
            FacebookAuthProvider.credential(facebookAccessToken.token);

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user;
          print(user);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            // Handle account exists with different credential
            return null;
          } else if (e.code == 'invalid-credential') {
            // Handle invalid credential
            return null;
          }
        } catch (e) {
          // Handle other exceptions
          return null;
        }
        break;

      case FacebookLoginStatus.cancel:
        // Handle login cancellation
        break;

      case FacebookLoginStatus.error:
        // Handle login error
        print('Error: ${result.errorMessage}');
        break;
    }

    return user;
  }
}
