import 'package:flutter/material.dart';

import '../widgets/cbl.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/custom_title.dart';
import '../widgets/header.dart';
import '../widgets/rounded_button_image.dart';
import '../widgets/round_button.dart';
import '../widgets/supportCard.dart';

class SeekHelp extends StatelessWidget {
  const SeekHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavBar(
        currentPage: 'Seek Help',
        resourcesRoute: 'None',
        seekHelpRoute: '/seekHelp',
        profileRoute: '/takeAction',
      ), //Available: Resources, Seek Help, Profile
      appBar: Header(
          isHome: true,
          onBackButtonPressed: () {
            //placeholder
          }),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/seekhelp.png',
                  width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
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
                  const SupportCard(), // Support card displayed below the text
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
                  subtitle: 'Talk with someone in real time\nProfile required*',
                  icon: Icons.phone,
                  iconColor: Colors.blue,
                  onPressed: () {
                    // Define what happens when the button is tapped
                    Navigator.pushNamed(context, '/takeAction');
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                roundButton(
                  label: 'Text',
                  subtitle: 'Chat with someone in real time\nProfile required*',
                  icon: Icons.chat,
                  iconColor: Colors.green,
                  onPressed: () {
                    // Define what happens when the button is tapped
                    Navigator.pushNamed(context, '/takeAction');
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
                    // Define what happens when the button is tapped
                    Navigator.pushNamed(context, '/haveYourVoiceHeard');
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
