import 'package:call_black_line/widgets/orange_button.dart';
import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/custom_navbar.dart';
import 'package:call_black_line/pages/use_preexisting_affirmation.dart';
import 'package:call_black_line/pages/create_new_affirmation.dart';

class CreateAffirmation extends StatelessWidget {
  const CreateAffirmation({super.key});

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
                'Lorem ipsum dolor sit amet consectetur. Molestie neque faucibus viverra ut nisl nec eleifend.',
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
            OrangeButton(
              buttonText: 'Create New',
              width: 160,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateNewAffirmation()),
                );
              },
            ),
            const SizedBox(
              height: 48,
            ),
            OrangeButton(
                buttonText: 'Use Pre-Existing',
                width: 200,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const UsePreexistingAffirmation()),
                  );
                },
                buttonColor: Colors.white,
                textColor: const Color(0xffdf742c)),
          ],
        ),
      ),
    );
  }
}
