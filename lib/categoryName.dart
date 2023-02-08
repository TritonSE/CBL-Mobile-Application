import 'package:flutter/material.dart';
import 'package:call_black_line/header.dart';
import 'resources.dart';

class CategoryName extends StatelessWidget {
  final List<String> titles;
  final List<String> descriptions;
  const CategoryName(
      {Key? key,
      this.titles = const [
        'Resource 1',
        'Resource 4',
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
    return Column(
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
            //physics: BouncingScrollPhysics(),
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/resoureTitle'),
                child: ResourceRect(
                  title: titles[0],
                  description: descriptions[0],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/resoureTitle'),
                child: ResourceRect(
                  title: titles[1],
                  description: descriptions[1],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/resoureTitle'),
                child: ResourceRect(
                  title: titles[2],
                  description: descriptions[2],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/resoureTitle'),
                child: ResourceRect(
                  title: titles[3],
                  description: descriptions[3],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/resoureTitle'),
                child: ResourceRect(
                  title: titles[4],
                  description: descriptions[4],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/resoureTitle'),
                child: ResourceRect(
                  title: titles[5],
                  description: descriptions[5],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/resoureTitle'),
                child: ResourceRect(
                  title: titles[6],
                  description: descriptions[6],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ResourceRect extends StatelessWidget {
  final String title;
  final String description;
  const ResourceRect(
      {Key? key,
      this.title = 'Resource title',
      this.description = 'description'})
      : super(key: key);
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 0.0, bottom: 16.0),
            child: Container(
                width: 358,
                height: 100,
                decoration: BoxDecoration(
                  color: themeColor,
                  borderRadius: BorderRadius.all(const Radius.circular(16)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        description,
                        style: const TextStyle(
                            fontSize: 17,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      )
                    ],
                  ),
                ))));
  }
}
