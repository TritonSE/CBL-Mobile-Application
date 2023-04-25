import 'package:call_black_line/widgets/cbl.dart';
import 'package:call_black_line/widgets/orange_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/custom_title.dart';
import '../widgets/header.dart';
import '../auth_methods.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  Future<String> getUsername(User? firebaseuser) async {
    String email = firebaseuser!.email!;
    // Get a reference to the Firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    // Create a query to search for documents where the email field matches the given email
    QuerySnapshot querySnapshot =
        await users.where('email', isEqualTo: email).get();

    // If there is a document that matches the query, return it
    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot? data = querySnapshot.docs.first;
      return data!['email'];
    }

    // Otherwise, return null
    return "Not found";
  }

  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User?>();
    var username = "John Doe";
    String? email = "Temp";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavBar(
        currentPage: 'Profile',
      ), //Available: Resources, Seek Help, Profile
      appBar: Header(
          isHome: true,
          onBackButtonPressed: () {
            //placeholder
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: CBL.padding),
        child: Column(
          children: [
            const CustomTitle(text: 'Profile'),
            const SizedBox(height: 50),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.person, color: Color(CBL.primaryOrange)),
                ),
                Text(
                  'Username: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: CBL.fontFamily,
                    fontWeight: CBL.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  username,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: CBL.fontFamily,
                  ),
                )
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.email, color: Color(CBL.primaryOrange)),
                ),
                Text(
                  'Email: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: CBL.fontFamily,
                    fontWeight: CBL.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  email!,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: CBL.fontFamily,
                  ),
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: OrangeButton(
                buttonText: 'Logout',
                width: 146,
                onTap: () async {
                  context.read<AuthenticationService>().signOut();
                  Navigator.pushNamed(context, '/seekHelp');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
