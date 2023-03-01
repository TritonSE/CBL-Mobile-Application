import 'package:flutter/material.dart';

class SocialMedia extends StatelessWidget {
  final int fbBlue;
  final int googleGreen;

  const SocialMedia({
    super.key,
    required this.fbBlue,
    required this.googleGreen,
  });

  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.of(context).size.width;
    return Flex(
      direction: mediaWidth < 390 ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 176,
          height: 48,
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(fbBlue),
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 14.5),
                    child: Image.asset(
                      'assets/images/facebook.png',
                    ),
                  ),
                  Center(
                    child: Text(
                      'Facebook',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: Color(fbBlue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              print("you clicked me");
            },
          ),
        ),
        SizedBox(
          width: 176,
          height: 48,
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(googleGreen),
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 14.5),
                    child: Image.asset(
                      'assets/images/google.png',
                    ),
                  ),
                  Center(
                    child: Text(
                      'Google',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: Color(googleGreen),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              print("you clicked me");
            },
          ),
        ),
      ],
    );
  }
}
