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
          width: CBL.boxWidth,
          height: CBL.boxHeight,
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(CBL.fbBlue),
                  width: CBL.containerWidth,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(CBL.borderRadiusLarge),
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
                      'Facebook',
                      style: TextStyle(
                        fontSize: CBL.fontSize,
                        fontFamily: CBL.fontFamily,
                        fontWeight: CBL.bold,
                        color: Color(CBL.fbBlue),
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
          width: CBL.boxWidth,
          height: CBL.boxHeight,
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(CBL.googleGreen),
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(CBL.borderRadiusLarge),
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
                      'Google',
                      style: TextStyle(
                        fontSize: CBL.fontSize,
                        fontFamily: CBL.fontFamily,
                        fontWeight: CBL.bold,
                        color: Color(CBL.googleGreen),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
