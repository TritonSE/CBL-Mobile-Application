import 'package:flutter/material.dart';
import 'package:call_black_line/pages/resources.dart';

class CategorySquare extends StatelessWidget {
  final String catText;
  final IconData icon;
  const CategorySquare(
      {Key? key, this.catText = 'category_name', required this.icon})
      : super(key: key);

  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 171,
        height: 171,
        //padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: themeColor,
          borderRadius: BorderRadius.all(const Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: Colors.black),
              SizedBox(
                height: 6,
              ),
              Text(
                catText,
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/category_name');
      },
    );
  }
}
