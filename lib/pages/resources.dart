import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/category_square.dart';

const themeColor = const Color(0xFFF7B279);
const buttonColor = const Color(0xFFDF742C);

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

                      //search bar code
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/category_name');
                        },
                        icon: const Icon(Icons.search),
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
