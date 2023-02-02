import 'package:flutter/material.dart';
import 'resources.dart';
import 'categoryName.dart';

class ResourceTitle extends StatelessWidget {
  const ResourceTitle({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        const SizedBox(
          width: 16,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 24,
            ),
            const Text('Resource Title',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34)),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              width: 357,
              child: Text(
                'Lorem ipsum dolor sit amet consectetur. Magna mattis lorem auctor tortor ut nunc lacus at in. Tellus tempor a habitasse ac augue eu.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              width: 170,
              height: 48,
              decoration: const BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(11.5),
                child: Text(
                  'Visit the site',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),

            /*Image(image: image
              height: 231,
              width: 358,
            )*/
            /*Image.network(
              IMAGEPLACEHOLDER,
              width: 358,
              height: 231,
            ),*/
          ],
        ),
        const SizedBox(
          width: 16,
        )
      ],
    );
  }
}
