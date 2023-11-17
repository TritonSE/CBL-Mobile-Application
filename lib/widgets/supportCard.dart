import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/cbl.dart';

class SupportCard extends StatelessWidget {
  const SupportCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16),
              child: Text(
                'We are here for you.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                  fontFamily: "Inter"
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 16, right: 16), // Same padding as the title for alignment
              child: Center(
                  child:
                 Text(
                'A space for peer support, counseling, witnessing and affirming the lived experiences to folks who are most impacted by systematic oppression with an LGBTQ+ Black Femme Lens.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: "Inter",
                ),
                 ),
              ),
            ),
          ],
        ),
      );
  }
}