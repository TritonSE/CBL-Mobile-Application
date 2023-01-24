import 'package:flutter/material.dart';
import 'resources.dart';

class CategoryName extends StatelessWidget {
    final List<String> titles = <String>['A', 'B', 'C'];
    final List<String> descriptions = <String>['a', 'b', 'c'];

    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children:  <Widget>[

                const Text('Category Name',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34)
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        SizedBox(
                            width: 16
                        ),

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
                                        color: Colors.orange,
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
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.all(const Radius.circular(16)),
                                    ),
                                ),
                                SizedBox(
                                    height: 16,
                                )
                            ]
                        ),

                        SizedBox(
                            width: 16
                        )
                    ],
 
                ) 
            ],
        );
    }
}


class ResourceRect extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
        children: [
            Container(
                width: 358,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(const Radius.circular(16)),
                ),
            ),
            SizedBox(
                height: 16,
            )
        ],
    );
    
    
  }
}