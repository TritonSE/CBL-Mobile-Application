import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/cbl.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/header.dart';
import '../widgets/round_button.dart';
import '../widgets/supportCard.dart';

class SeekHelp extends StatefulWidget {
  const SeekHelp({super.key});

  @override
  State<SeekHelp> createState() => _SeekHelpState();
}

class _SeekHelpState extends State<SeekHelp> {
  String phoneNumber = '';
  String displayedPhoneNumber = '';
  Future getPhoneNumber() async {
    FirebaseFirestore.instance
        .collection('config')
        .doc("phone")
        .get()
        .then((DocumentSnapshot snapshot) async {
      if (snapshot.exists) {
        setState(() {
          phoneNumber = snapshot['number'];
          displayedPhoneNumber =
              '1(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}';
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getPhoneNumber();
  }

  Future<void> launchCall() async {
    final Uri url = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw Exception("Error occured trying to call that number.");
    }
  }

  Future<void> launchText() async {
    final Uri url = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw Exception("Error occured trying to text that number.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User?>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavBar(
        currentPage: 'Seek Help',
        resourcesRoute: '/resources',
        seekHelpRoute: '/seekHelp',
        profileRoute: '/profile',
      ), //Available: Resources, Seek Help, Profile
      appBar: Header(
          isHome: true,
          onBackButtonPressed: () {
            //placeholder
          }),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: CBL.padding),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/seekhelp.png',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30, left: 15, right: 15, bottom: 15),
                        child: Text(
                          "Seek Help",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              letterSpacing: 0.4,
                              fontFamily: CBL.fontFamily,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const SupportCard(),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: CBL.padding),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    roundButton(
                      label: 'Call',
                      subtitle:
                          'Talk with someone in real time${firebaseuser == null ? '\nProfile required*' : ''}',
                      icon: Icons.phone,
                      iconColor: Colors.blue,
                      onPressed: () {
                        if (firebaseuser == null) {
                          // send user to sign in page
                          Navigator.pushNamed(context, '/takeAction');
                        } else {
                          launchCall();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    roundButton(
                      label: 'Text',
                      subtitle:
                          'Chat with someone in real time${firebaseuser == null ? '\nProfile required*' : ''}',
                      icon: Icons.chat,
                      iconColor: Colors.green,
                      onPressed: () {
                        if (firebaseuser == null) {
                          // send user to sign in page
                          Navigator.pushNamed(context, '/takeAction');
                        } else {
                          launchText();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    roundButton(
                      label: 'Write',
                      subtitle: 'Write about your mistreatment',
                      icon: Icons.edit,
                      iconColor: Colors.orange,
                      onPressed: () {
                        Navigator.pushNamed(context, '/haveYourVoiceHeard');
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
