import 'package:flutter/material.dart';
import 'categoryName.dart';

class Resources extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Row (
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
                SizedBox(
                    height: 16,
                ),

                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                        //title of page: resources
                        const Text('Resources',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34)
                        ),
                        
                        //search bar code

                        //subtitle: categories
                        const Text('Categories',
                            //textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22)
                        ),

                        SizedBox(
                            height: 16,
                        ),

                        //row 1 of two containers
                        Row(
                            
                            children: [
                                CategorySquare(),
                                SizedBox(
                                    width: 16,
                                ),
                                CategorySquare(),
                            ],
                        ),
                        
                        SizedBox(
                            height: 16,
                        ),
                        
                        Row(
                            children: [
                                CategorySquare(),
                                SizedBox(
                                    width: 16,
                                ),
                                CategorySquare(),
                            ],
                        ),

                        SizedBox(
                            height: 16,
                        ),

                        Container(
                            height: 85.5,
                            width: 358,
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
                    height: 16,
                )
                    
                

                

                
            ] 
        );
    }
}

//search bar class
/*class SearchBar extends StatelessWidget {
    const SearchBar({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: Header(),
            body
        )
    }
}*/

//Search bar features
/*class CustomSearchDelegate extends SearchDelegate {
    //Demo list to show querying
    List<String> searchResults = [
        "Resource1",
        "Resource2",
        "Resource3"
    ];

    //first overwrite to clear the search text
    @override
    List<Widget>? buildActions(BuildContext context) {
        return [
            IconButton(
                onPressed: () {
                    query = '';
                },
                icon: Icon(Icons.clear),
            )
        ];
    }

    //second overwrite to pop out of search menu
    @override
    Widget? buildLeading(BuildContext context) {
        return IconButton(
            onPressed: () {
                close(context, null);
            },
            icon: Icon(Icons.arrow_back),
        );
    }

    @override
    Widget buildResults(BuildContext context) {
        List<String> matchQuery = [];
        for (var resource in searchResults) {
            if (resource.toLowerCase().contains(query.toLowerCase())) {
                matchQuery.add(resource);
            }
        }
        return ListView.builder(
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
                var result = matchQuery[index];
                return ListTile(
                    title: Text(result),
                );
            }
        );
    }
    
    //last overwrite to show the querying process at the runtime
    @override
    Widget buildSuggestions(BuildContext context) {
        List<String> matchQuery = [];
        for (var in resource in searchResults) {
            if (resource.toLowerCase().contains(query.toLowerCase())) {
                matchQuery.add(resource);
            }
        }
        return ListView.builder(
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
                var result = matchQuery[index];
                retrun ListTile(
                    title: Text(result),
                );
            },
        );
    }
}*/

class CategorySquare extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      width: 171,
      height: 171,
      //padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.all(const Radius.circular(16)),
      ),
    );
  }
}