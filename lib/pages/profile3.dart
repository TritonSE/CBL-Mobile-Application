import 'package:call_black_line/user.dart';
import 'package:call_black_line/widgets/cbl.dart';
import 'package:call_black_line/widgets/orange_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../big_auth.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/custom_title.dart';
import '../widgets/header.dart';
import '../auth_methods.dart';

class Profile extends StatefulWidget {
  Profile({super.key});
  var db = FirebaseFirestore.instance;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = "";

  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

  Future<String> fetchUserName() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final String? userId = user?.email;

    try {
      DocumentReference<Map<String, dynamic>> docRef = FirebaseFirestore
          .instance
          .collection('users')
          .doc("UM8cYNpncgPETJ9XmvdLtmAZfS13");
      DocumentSnapshot<Map<String, dynamic>> docSnapshot = await docRef.get();
      print(10);
      return username = docSnapshot['username'];
    } catch (e) {
      print('Error getting user name: $e');
      return " ";
    }
    /*
    var db = FirebaseFirestore.instance;
    final docRef = db.collection("users").doc("e@gmail.com");
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        username = data['username'];
        print(username);
      },
      onError: (e) => print("Error getting document: $e"),
    );
    */
  }

  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User?>();
    String? email = firebaseuser!.email;

    /*
    final User? user = FirebaseAuth.instance.currentUser;
    final String? userId = user?.email;
    // fetchUserName();
    var db = FirebaseFirestore.instance;
    final docRef = db.collection("users").doc("e@gmail.com");
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        username = data['username'];
      },
      onError: (e) => print("Error getting document: $e"),
    );
    */

    /*
    StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            print("non-exis");
            return CircularProgressIndicator();
          }
          UserDataWPassword userDocument = snapshot.data as UserDataWPassword;
          username = userDocument.username;
          print("here");
          return CircularProgressIndicator();
        });
      */

    print(username);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavBar(
        currentPage: 'Profile',
        seekHelpRoute: '/callTextNow',
        profileRoute: '/profile',
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
