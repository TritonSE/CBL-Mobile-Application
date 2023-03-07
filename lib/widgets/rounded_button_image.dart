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
    this.textPaddingTop = 0.0,
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
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Colors.black,
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                const Color(0xff6C6C6C).withOpacity(0.55),
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
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
