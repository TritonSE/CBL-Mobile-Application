import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/category_square.dart';
import 'package:call_black_line/widgets/search_bar.dart';

const themeColor = Color(0xFFF7B279);
const buttonColor = Color(0xFFDF742C);
const primaryVarColor = Color(0xFFD55B26);
const secondaryTextColor = Color(0xFF6C6C6C);

/*
 * This file is the first page of the resources flow and contains
 * the available categories 
 */
class Resources extends StatelessWidget {
  const Resources({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: Header(
            isHome: true,
            onBackButtonPressed: () {
              Navigator.pushNamed(context, '/');
            }),
        body: SingleChildScrollView(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
              const SizedBox(
                width: 16,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          // Adding title of the page
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Resources',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 34,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                      // Adding the search bar
                      //SearchBar(),

                      const SizedBox(
                        height: 24,
                      ),

                      // Adding Subtitle: categories
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Categories',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF111827),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      // Adding categories
                      // row 1 of two containers
                      Row(
                        children: const [
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

                      const SizedBox(
                        height: 16,
                      ),

                      // row 2 of two containers
                      Row(
                        children: const [
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

                      const SizedBox(
                        height: 16,
                      ),

                      // Adding option to see all resources available
                      GestureDetector(
                        child: Row(
                          children: [
                            Flexible(
                                fit: FlexFit.tight,
                                child: Container(
                                    height: 85.5,
                                    decoration: const BoxDecoration(
                                      color: themeColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Text(
                                        'All Resources',
                                        style: TextStyle(
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

                      const SizedBox(
                        height: 16,
                      )
                    ]),
              ),
              const SizedBox(
                width: 16,
              )
            ])));
  }
}
