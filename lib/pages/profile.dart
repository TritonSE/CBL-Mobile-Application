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

  Future<String> getUsername(BuildContext context) async {
    //get parameters of current users
    final firebaseuser = context.watch<User?>();
    String? email = "";
    email = firebaseuser?.email;
    try {
      //get username from database, currently using email as unique identifier
      DocumentReference<Map<String, dynamic>> docRef =
          FirebaseFirestore.instance.collection('users').doc(email);
      DocumentSnapshot<Map<String, dynamic>> docSnapshot = await docRef.get();

      //return the username of the document gotten
      return docSnapshot['username'];
    } catch (e) {
      Navigator.pushNamed(context, '/takeAction');
      return " ";
    }
  }

  deleteUser(BuildContext context) async {
    final User firebaseuser = FirebaseAuth.instance.currentUser!;
    // Delete Firebase user
    await firebaseuser.delete();
    DocumentReference<Map<String, dynamic>> userDoc =
        FirebaseFirestore.instance.collection('users').doc(firebaseuser.email);
    // Delete Firestore user document
    await userDoc.delete();
  }

  showDeleteAccountDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget yesButton = TextButton(
      child: const Text("Yes"),
      onPressed: () async {
        await deleteUser(context);
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Delete account?"),
      content: const Text(
          "Are you sure you would like to delete your account? This action cannot be undone."),
      actions: [
        cancelButton,
        yesButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User?>();
    String? email = firebaseuser?.email;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavBar(
        currentPage: 'Profile',
        resourcesRoute: '/resources',
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
            //using future builder to build widget once username is retrieved
            FutureBuilder<String>(
              future: getUsername(context),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child:
                            Icon(Icons.person, color: Color(CBL.primaryOrange)),
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
                        //use the data gotten from snapshot
                        snapshot.data!,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: CBL.fontFamily,
                        ),
                      )
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
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
                Flexible(
                  child: Text(
                    email ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: CBL.fontFamily,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                showDeleteAccountDialog(context);
              },
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child:
                        Icon(Icons.delete_forever, color: Color(CBL.alertRed)),
                  ),
                  Text(
                    'Delete account',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: CBL.fontFamily,
                        fontWeight: CBL.bold,
                        color: const Color(CBL.alertRed)),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
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
