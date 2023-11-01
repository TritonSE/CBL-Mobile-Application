import 'package:flutter/material.dart';
import 'package:call_black_line/pages/resources.dart';

/*
 * This file contains the generic format for each resource that will be listed
 * when a category is selected 
 */
class ResourceRect extends StatelessWidget {
  final String title;
  final String description;
  // Defining fields in the generic format
  const ResourceRect(
      {Key? key,
      this.title = 'Resource title',
      this.description = 'description'})
      : super(key: key);
  Widget build(BuildContext context) {
    // Adding routing when clicked on
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/resource_title'),
        child: Container(
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
                    )
                )
            )
        )
    );
  }
}
