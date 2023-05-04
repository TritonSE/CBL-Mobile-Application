import 'package:call_black_line/widgets/cbl.dart';
import 'package:flutter/material.dart';

class RoundedButtonImage extends StatelessWidget {
  final String imageURL;
  final String text;
  final double width;
  final double textPaddingTop; //Optional
  final AlignmentGeometry textContainerAlignment; //Optional
  final double height;
  final double textContainerWidth; //Optional
  final Function()? onTap;

  const RoundedButtonImage({
    super.key,
    required this.height,
    required this.width,
    required this.imageURL,
    required this.text,
    this.textPaddingTop = CBL.paddingTop,
    this.textContainerAlignment = Alignment.center,
    this.textContainerWidth = double.infinity,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(CBL.borderRadiusLarge)),
          color: Color(CBL.black),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                const Color(CBL.gray).withOpacity(CBL.grayOpacity),
                BlendMode.srcATop,
              ),
              image: AssetImage(imageURL),
              fit: BoxFit.cover),
        ),
        child: Align(
          alignment: textContainerAlignment,
          child: SizedBox(
            width: textContainerWidth,
            child: Padding(
              padding: EdgeInsets.only(top: textPaddingTop),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: CBL.fontSize,
                    fontFamily: CBL.fontFamily,
                    fontWeight: CBL.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
