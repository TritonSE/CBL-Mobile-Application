import 'package:call_black_line/widgets/orange_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/custom_navbar.dart';
import 'package:call_black_line/widgets/text_area.dart';
import 'package:call_black_line/pages/affirmation_sent.dart';
import 'package:call_black_line/affirmation.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class CreateNewAffirmation extends StatefulWidget {
  const CreateNewAffirmation({super.key});

  @override
  State<CreateNewAffirmation> createState() => _CreateNewAffirmation();
}

class _CreateNewAffirmation extends State<CreateNewAffirmation> {
  final textAreaController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textAreaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(onBackButtonPressed: () {
        //placeholder
      }),
      bottomNavigationBar: const CustomNavBar(
        currentPage: 'Resources',
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: [
            const CustomTitle(text: 'Create an Affirmation'),
            const SizedBox(
              width: 250,
              child: Text(
                'Write your affirmation using the textbox below.',
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            TextArea(
                hintText: "Type something", controller: textAreaController),
            const SizedBox(
              height: 90,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: OrangeButton(
                  buttonText: 'Submit',
                  width: 110,
                  onTap: () {
                    AffirmationRepository affirmationRepository =
                        AffirmationRepository();
                    Affirmation affirmation = Affirmation(
                        text: textAreaController.text,
                        uid: auth.currentUser?.uid ?? '',
                        created: DateTime.now().millisecondsSinceEpoch);
                    affirmationRepository.addAffirmation(affirmation);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AffirmationSent()));
                  },
                )),
          ],
        ),
      )),
    );
  }
}
