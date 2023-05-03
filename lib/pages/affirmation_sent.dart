import 'package:call_black_line/widgets/orange_button.dart';
import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/custom_navbar.dart';

class AffirmationSent extends StatelessWidget {
  const AffirmationSent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Header(isHome: true),
      bottomNavigationBar: const CustomNavBar(
        currentPage: 'Resources',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: const [
            CustomTitle(text: 'Create an Affirmation', bottomPadding: 30),
            SizedBox(
              width: 250,
              child: Text(
                'Your affirmation has been sent!',
                style: TextStyle(
                    fontSize: 21,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 48,
            ),
            OrangeButton(
              buttonText: 'Back to Resources',
              width: 235,
              // onTap: () { Navigator.pushNamed(context, '/resources'); },
            ),
          ],
        ),
      ),
    );
  }
}
