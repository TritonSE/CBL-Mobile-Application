import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/category_square.dart';

const themeColor = const Color(0xFFF7B279);
const buttonColor = const Color(0xFFDF742C);

class Resources extends StatelessWidget {
  const Resources({super.key});
  //moves from resource page to next page when search bar is used
  /*void _categoryNamePage(BuildContext context) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryName()));
    }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const Header(),
        body: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                width: 16,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 85.5,
                        ),
                        const Text(
                          'Resources',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 34,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    //title of page: resources

                    /*SizedBox(
                  height: 40,
                ),*/
                    //search bar code
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/category_name');
                      },
                      icon: const Icon(Icons.search),
                    ),

                    //subtitle: categories
                    const Text(
                      'Categories',
                      style: const TextStyle(
                        fontSize: 22,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF111827),
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
                      child: Container(
                          height: 85.5,
                          width: 358,
                          decoration: BoxDecoration(
                            color: themeColor,
                            borderRadius:
                                BorderRadius.all(const Radius.circular(16)),
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
                          )),
                      onTap: () {
                        Navigator.pushNamed(context, '/category_name');
                      },
                    ),

                    SizedBox(
                      height: 16,
                    )
                  ]),
              SizedBox(
                height: 16,
              )
            ]));
  }
}
