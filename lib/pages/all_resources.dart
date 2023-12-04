import 'package:call_black_line/widgets/resource_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/cbl.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/custom_title.dart';
import '../widgets/header.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class AllResources extends StatefulWidget {
  final String title;

  const AllResources({super.key, this.title = ""});

  @override
  State<AllResources> createState() => _AllResourcesState();
}

class _AllResourcesState extends State<AllResources> {
  var _resourceData = [];

  late AnimationController rotationController;

  Future<dynamic> loadJsonData() async {
    String jsonString =
        await rootBundle.loadString('assets/data/resources.json');

    var decodedData = await json.decode(jsonString);

    var resourceList = decodedData["resources"];

    if (widget.title != "All Resources") {
      resourceList = resourceList
          .where((resource) => resource["category"] == widget.title)
          .toList();
    }

    return resourceList;
  }

  @override
  void initState() {
    super.initState();

    // Load the JSON data
    loadJsonData().then((data) {
      setState(() {
        _resourceData = data;
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
      appBar: Header(onBackButtonPressed: () {
        Navigator.pushNamed(context, '/resources');
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: CBL.padding),
          child: Column(
            children: [
              CustomTitle(text: widget.title),
              if (_resourceData.isNotEmpty)
                for (var resource in _resourceData)
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
