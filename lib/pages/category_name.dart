import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/resource_rect.dart';

class CategoryName extends StatelessWidget {
  final List<String> titles;
  final List<String> descriptions;
  const CategoryName(
      {Key? key,
      this.titles = const [
        'Resource 1',
        'Resource 2',
        'Resource 3',
        'Resource 4',
        'Resource 5',
        'Resource 6',
        'Resource 7'
      ],
      this.descriptions = const [
        'desc 1',
        'desc 2',
        'desc 3',
        'desc 4',
        'desc 5',
        'desc 6',
        'desc 7'
      ]})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const Header(),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Category Name',
              //textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 34,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 580,
              child: ListView(
                children: [
                  ResourceRect(
                    title: titles[0],
                    description: descriptions[0],
                  ),
                  ResourceRect(
                    title: titles[1],
                    description: descriptions[1],
                  ),
                  ResourceRect(
                    title: titles[2],
                    description: descriptions[2],
                  ),
                  ResourceRect(
                    title: titles[3],
                    description: descriptions[3],
                  ),
                  ResourceRect(
                    title: titles[4],
                    description: descriptions[4],
                  ),
                  ResourceRect(
                    title: titles[5],
                    description: descriptions[5],
                  ),
                  ResourceRect(
                    title: titles[6],
                    description: descriptions[6],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            )
          ],
        )));
  }
}
