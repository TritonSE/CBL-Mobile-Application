//Credit for fetching async data: https://www.youtube.com/watch?v=A9IN0cpPCZE

import 'package:call_black_line/widgets/cbl.dart';
import 'package:call_black_line/widgets/orange_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/custom_title.dart';
import '../widgets/header.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final CollectionReference userCollection =
    FirebaseFirestore.instance.collection('users');

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = '';
  String email = auth.currentUser?.email ?? '';
  Future _getFireStoreUser() async {
    userCollection
        .doc(auth.currentUser?.uid)
        .get()
        .then((DocumentSnapshot snapshot) async {
      if (snapshot.exists) {
        setState(() {
          username = snapshot["username"];
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getFireStoreUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavBar(
        currentPage: 'Profile',
      ), //Available: Resources, Seek Help, Profile
      appBar: const Header(
        isHome: true,
      ),
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
                  email,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: CBL.fontFamily,
                  ),
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: OrangeButton(
                  buttonText: 'Logout',
                  width: 146,
                  onTap: () async {
                    // context.read<AuthenticationService>().signOut();
                    await auth.signOut();
                    Navigator.pushNamed(context, '/seekHelp');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
