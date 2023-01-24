import 'package:flutter/material.dart';
import 'resources.dart';
import 'categoryName.dart';

class ResourceTitle extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Row (
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
                SizedBox(
                    width: 16,
                ),
                Column(
                    children: [
                        const Text('Resource Title',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34)
                        ),

                        const Text('Lorem ipsum dolor sit amet consectetur', 
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17)
                        ),

                        Container(
                            width: 170,
                            height: 48,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.all(const Radius.circular(16)),
                            ),
                        ),

                    ],
                ),

                SizedBox(
                    width: 16,
                )

            ],
        );
    }
}