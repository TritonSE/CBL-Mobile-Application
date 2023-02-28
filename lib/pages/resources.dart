import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/category_square.dart';

const themeColor = const Color(0xFFF7B279);
const buttonColor = const Color(0xFFDF742C);
const primaryVarColor = const Color(0xFFD55B26);
const secondaryTextColor = const Color(0xFF6C6C6C);

class Resources extends StatelessWidget {
  const Resources({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const Header(),
        body: SingleChildScrollView(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
              SizedBox(
                width: 16,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /*SizedBox(
                            width: 85.5,
                          ),*/
                          Align(
                              alignment: Alignment.center,
                              child: const Text(
                                'Resources',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 34,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      //search bar code
                      Container(
                        height: 38,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(const Radius.circular(16)),
                            border: Border.all(
                              color: primaryVarColor,
                              width: 1,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 18.75, right: 17.33, top: 8.0, bottom: 8.0),
                          child: Row(children: [
                            SizedBox(
                                width: 16.03,
                                height: 16.03,
                                child: const Icon(
                                  Icons.search,
                                  color: primaryVarColor,
                                )),
                            SizedBox(
                              width: 11.22,
                            ),
                            const Text(
                              'Search something',
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  color: secondaryTextColor),
                            ),
                            SizedBox(
                                width: 13.33,
                                height: 13.33,
                                child: const Icon(
                                  Icons.cancel,
                                  color: primaryVarColor,
                                )),
                          ]),
                        ),
                      ),

                      SizedBox(
                        height: 24,
                      ),

                      //subtitle: categories
                      Align(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Categories',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 22,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF111827),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      //row 1 of two containers
                      Row(
                        children: [
                          CategorySquare(
                            catText: 'Medical',
                            icon: Icons.medical_services_outlined,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          CategorySquare(
                            catText: 'Legal',
                            icon: Icons.balance_outlined,
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      Row(
                        children: [
                          CategorySquare(
                            catText: 'Housing',
                            icon: Icons.house_outlined,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          CategorySquare(
                            catText: 'Domestic Violence',
                            icon: Icons.shield_outlined,
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      InkWell(
                        child: Row(
                          children: [
                            Flexible(
                                fit: FlexFit.tight,
                                child: Container(
                                    height: 85.5,
                                    decoration: BoxDecoration(
                                      color: themeColor,
                                      borderRadius: BorderRadius.all(
                                          const Radius.circular(16)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        'Resources',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ))),
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/category_name');
                        },
                      ),

                      SizedBox(
                        height: 16,
                      )
                    ]),
              ),
              SizedBox(
                width: 16,
              )
            ])));
  }
}
