import 'package:flutter/material.dart';
import '../pages/resources.dart';
import 'package:call_black_line/widgets/header.dart';

/*
 * This file is the front end for a generic selected resource
 * which includes:
 * the title of the resource,
 * a message pertaining to the resource,
 * a button for visiting the site of the resource,
 * an image relating to the resource 
 */
class ResourceTitle extends StatelessWidget {
  const ResourceTitle({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: Header(isHome: true, onBackButtonPressed: () {
            Navigator.pushNamed(context, '/');
        }),
        body: SingleChildScrollView(
            child: Column(children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                        const SizedBox(
                            width: 16,
                        ),
                        Flexible(
                            fit: FlexFit.tight,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                    const SizedBox(
                                        height: 24,
                                    ),
                                    // Adds the title of the resource
                                    const Text('Resource Title',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 34)
                                    ),
                                    const SizedBox(
                                    height: 32,
                                    ),
                                    // Adds the message/content of the resource
                                    const SizedBox(
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
                                        // Adds a button to visit the site of the resource
                                        child: const Padding(
                                            padding: EdgeInsets.all(11.5),
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
                                    // Adds an image related to the resource
                                    Image(
                                        image: const AssetImage('assets/images/placeholder.png'),
                                        height: 231 / 358 * MediaQuery.of(context).size.width,
                                        width: MediaQuery.of(context).size.width,
                                    )
                                ],
                            ),
                        ),
                        const SizedBox(
                            width: 16,
                        )
                    ],
                ),
                const SizedBox(height: 16),
            ]
            )
        )
    );
  }
}