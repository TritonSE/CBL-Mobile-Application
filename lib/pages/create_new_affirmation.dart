import 'package:call_black_line/widgets/orange_button.dart';
import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/custom_navbar.dart';
import 'package:call_black_line/widgets/text_area.dart';
import 'package:call_black_line/pages/affirmation_sent.dart';

class CreateNewAffirmation extends StatelessWidget {
  const CreateNewAffirmation({super.key});

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
      body: Padding(
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
            const TextArea(hintText: "Type something"),
            const SizedBox(
              height: 90,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: OrangeButton(
                  buttonText: 'Submit',
                  width: 110,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AffirmationSent()));
                  },
                )),
          ],
        ),
      ),
    );
  }
}
