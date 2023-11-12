import 'package:call_black_line/widgets/cbl.dart';
import 'package:flutter/material.dart';

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.of(context).size.width;
    return Flex(
      direction:
          mediaWidth < CBL.smallMediaWidth ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 325,
          height: CBL.boxHeight,
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(CBL.black),
                  width: CBL.thickness,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: CBL.paddingRight),
                    child: Image.asset(
                      'assets/images/google.png',
                    ),
                  ),
                  Center(
                    child: Text(
                      'Continue with Google',
                      style: TextStyle(
                        fontSize: CBL.fontSize,
                        fontFamily: CBL.fontFamily,
                        fontWeight: CBL.bold,
                        color: Color(CBL.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {},
          ),
        ),
        SizedBox(
          height: CBL.padding,
        ),
        SizedBox(
          width: 325,
          height: CBL.boxHeight,
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(CBL.black),
                  width: CBL.thickness,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: CBL.paddingRight),
                    child: Image.asset(
                      'assets/images/facebook.png',
                    ),
                  ),
                  Center(
                    child: Text(
                      'Continue with Facebook',
                      style: TextStyle(
                        fontSize: CBL.fontSize,
                        fontFamily: CBL.fontFamily,
                        fontWeight: CBL.bold,
                        color: Color(CBL.black),
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
