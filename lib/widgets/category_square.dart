import 'package:call_black_line/widgets/cbl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategorySquare extends StatelessWidget {
  final String catText;
  final String icon;
  final String page;
  const CategorySquare(
      {Key? key,
      this.catText = 'category_name',
      required this.icon,
      required this.page})
      : super(key: key);

  Widget build(BuildContext context) {
    return Flexible(
        fit: FlexFit.tight,
        child: InkWell(
          child: Container(
            height: 171,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                border: Border.all(color: Color(CBL.lightGray), width: 1.5),
                boxShadow: const [CBL.boxShadow]),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Setting icon for category box
                  SvgPicture.asset(
                    "assets/icons/$icon.svg",
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Expanded(
                    // Setting standard font, size, and color
                    child: Text(
                      catText,
                      style: const TextStyle(
                          fontSize: 19,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
          // Adding routing when box is clicked
          onTap: () {
            Navigator.pushNamed(context, '/$page');
          },
        ));
  }
}
