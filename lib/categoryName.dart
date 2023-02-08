import 'package:flutter/material.dart';
import 'resources.dart';

class CategoryName extends StatelessWidget {
  const CategoryName({super.key});
  //final List<String> titles = <String>['A', 'B', 'C'];
  //final List<String> descriptions = <String>['a', 'b', 'c'];

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
              ResourceRect(
                title: 'resource 1',
                description: 'desc 1',
              ),
              ResourceRect(
                title: 'resource 2',
                description: 'desc 2',
              ),
              ResourceRect(
                title: 'resource 3',
                description: 'desc 3',
              ),
              ResourceRect(
                title: 'resource 4',
                description: 'desc 4',
              ),
              ResourceRect(
                title: 'resource 5',
                description: 'desc 5',
              ),
              ResourceRect(
                title: 'resource 6',
                description: 'desc 6',
              ),
              ResourceRect(
                title: 'resource 7',
                description: 'desc 7',
              )
            ],
          ),
        ),

        /*Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 16),
            ListView(
                /*itemCount: titles.length,
                            itemBuilder: (BuildContext context, int index) {
                                return ResourceRect(
                                    //child: Center(child: Text('${titles[index]}')),
                                );
                            }*/
                children: <Widget>[
                  Container(
                    width: 358,
                    height: 100,
                    decoration: BoxDecoration(
                      color: themeColor,
                      borderRadius: BorderRadius.all(const Radius.circular(16)),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 358,
                    height: 100,
                    decoration: BoxDecoration(
                      color: themeColor,
                      borderRadius: BorderRadius.all(const Radius.circular(16)),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  )
                ]),
            SizedBox(width: 16)
          ],
        )*/
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
    return Padding(
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
            )));
  }
}
