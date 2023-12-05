import 'package:call_black_line/widgets/resource_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/cbl.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/custom_title.dart';
import '../widgets/header.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class SearchResources extends StatefulWidget {
  const SearchResources({super.key});

  @override
  State<SearchResources> createState() => _SearchResourcesState();
}

class _SearchResourcesState extends State<SearchResources> {
  var allResources = [];
  var filteredResources = [];

  late AnimationController rotationController;

  final TextEditingController searchController = TextEditingController();

  Future<dynamic> loadJsonData() async {
    String jsonString =
        await rootBundle.loadString('assets/data/resources.json');

    var decodedData = await json.decode(jsonString);

    var resourceList = decodedData["resources"];

    return resourceList;
  }

  void filterResources() {
    String currentQuery = searchController.text.toLowerCase();
    setState(() {
      print(currentQuery);
      if (currentQuery == "") {
        filteredResources = allResources;
      } else {
        filteredResources = allResources
            .where((item) =>
                (item["title"].toLowerCase().contains(currentQuery)) ||
                item["description"].toLowerCase().contains(currentQuery) ||
                item["category"].toLowerCase().contains(currentQuery))
            .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();

    searchController.addListener(filterResources);

    // Load the JSON data
    loadJsonData().then((data) {
      setState(() {
        allResources = data;
        filteredResources = allResources;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavBar(
        currentPage: 'Resources',
        resourcesRoute: '/resources',
        seekHelpRoute: '/seekHelp',
        profileRoute: '/takeAction',
      ), //Available: Resources, Seek Help, Profile
      appBar: AppBar(
        shadowColor: Colors.black.withOpacity(0.4),
        automaticallyImplyLeading: false, //Remove default back arrow
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Color(CBL.primaryOrange),
                    width: 1,
                  ),
                ),
                child: Center(
                  // Adds the attribute of typing into the search bar
                  child: TextField(
                    controller: searchController,
                    autofocus: true,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      prefixIconConstraints:
                          BoxConstraints(maxHeight: 40, maxWidth: 35),
                      prefixIcon: IconButton(
                        padding: EdgeInsets.only(left: 5),
                        iconSize: 25,
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                        color: Color(CBL.primaryOrange),
                      ),
                      hintText: 'Search resources...',
                      hintStyle: TextStyle(fontSize: 17),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/resources'),
              child: Text(
                "Cancel",
                style: TextStyle(
                    color: Color(CBL.primaryOrange),
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: CBL.padding),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              if (filteredResources.isNotEmpty)
                for (var resource in filteredResources)
                  ResourceCard(
                      title: resource["title"],
                      description: resource["description"],
                      category: resource["category"],
                      link: resource["link"]),
            ],
          ),
        ),
      ),
    );
  }
}
