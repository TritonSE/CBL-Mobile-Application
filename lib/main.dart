// export PATH="$PATH:`pwd`/flutter/bin"

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resources',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Call BlackLine'),
    );
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget scaf (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Column(
      
      //body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        //child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
      
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget> [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Resources',
              style: TextStyle(fontSize: 30),
            )
          ]
        ),
        /*Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          /*appBar: PreferredSize(
            preferredSize: Size.fromHeight(15),
            child: ,
          )*/
          children: [
            // The app bar created is the search bar on the resources page
            // TODO: make AppBar into widget for easier read of code
            AppBar(
              // Changing the content of the search bar including text and textcolor
              // TODO: adjusting opaqueness of the text and search box
              title: Text('Search something', style: TextStyle(color: Color(0x00000172)),),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    // method to show the search bar
                    showSearch(
                      context: context,
                      // delegate to customize the search bar
                      delegate: CustomSearchDelegate()
                    );
                  },
                  icon: const Icon(Icons.search),
                )
              ],
            )
          ],
        ),*/
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Categories",
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategorySquare(),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategorySquare(),
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategorySquare(),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategorySquare(),
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "All Resources",
            )
          ],
        )
      ]
    );
  }
}
          /*mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //Adding the Resources Title
            Text(
              'Resources',
              style: TextStyle(fontSize: 30),
            ),*/
            //Adding the search bar underneath the resources title
            /*AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              // font color of the search bar changed to grey
              title: Text('Search something', 
                      style: TextStyle(color: Color.fromRGBO(6C6C6C)),),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    // method to show the search bar
                    showSearch(
                      context: context,
                      // delegate to customize the search bar
                      delegate: CustomSearchDelegate()
                    );
                  },
                  icon: const Icon(Icons.search),
                )
              ],
            ),
            Text(
              'Categories',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CategorySquare(),
                CategorySquare(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CategorySquare(),
                CategorySquare(),
              ],
            ),*/
            
           // This trailing comma makes auto-formatting nicer for build methods.
   

//categories orange square buttons
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


//the search bar
/*class SearchBar extends StatelessWidget{
  Widget build(BuildContext context) => Scaffold(
          appBar: AppBar(
            title: const Text('Search'),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: MySearchDelegate(),
                  );
                },
              ), //IconButton
            ],
          ), //AppBar
          body: Container(),
  ); //Scaffold
}

//FIX THE SEARCH BAR
class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => close(context, null), //close searchbar
  );

  @override List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      icon: const Icon(Icons.clear),
      onPressed: (){
        if (query.isEmpty) {
          close(context, null); //close searchbar
        }
        else{
          query = '';
        }
      },
    ), //IconButton
  ];


}*/
/*class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchResults = [
    "Resource1",
    "Resource2",
    "Resource3"
  ];
    
  // first overwrite to clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
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
      },
    );
  }

  // last overwrite to show the querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
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
      },
    );
  }
}*/

