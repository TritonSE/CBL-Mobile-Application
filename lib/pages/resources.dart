import 'package:flutter/material.dart' hide SearchBar;
import 'package:call_black_line/widgets/cbl.dart';
import 'package:call_black_line/widgets/custom_navbar.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/resource_nav_card.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/category_square.dart';
import 'package:call_black_line/widgets/search_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

const themeColor = Color(0xFFF7B279);
const buttonColor = Color(0xFFDF742C);
const primaryVarColor = Color(0xFFD55B26);
const secondaryTextColor = Color(0xFF6C6C6C);

/*
 * This file is the first page of the resources flow and contains
 * the available categories 
 */
class Resources extends StatelessWidget {
  const Resources({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(CBL.backgroundColor),
        bottomNavigationBar: const CustomNavBar(
          currentPage: 'Resources',
          resourcesRoute: '/resources',
          seekHelpRoute: '/seekHelp',
          profileRoute: '/takeAction',
        ), //Available: Resources, Seek Help, Profile
        appBar: Header(
            isHome: true,
            onBackButtonPressed: () {
              Navigator.pushNamed(context, '/');
            }),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: CBL.padding),
          child: Column(children: [
            const CustomTitle(text: 'Resources'),

            const ResourceNavCard(
              title: "View Affirmations",
              page: "allAffirmations",
              suffixIcon: "right_arrow",
            ),

            const SizedBox(
              height: 16,
            ),

            // Adding the search bar
            SearchBar(),

            const SizedBox(
              height: 24,
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Categories',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF111827),
                ),
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            // Adding categories
            // row 1 of two containers
            Row(
              children: const [
                CategorySquare(
                    catText: 'Mental Health',
                    icon: 'medical',
                    page: "resources"),
                SizedBox(
                  width: 16,
                ),
                CategorySquare(
                    catText: 'Prisoner Advocacy',
                    icon: 'scales',
                    page: "resources"),
              ],
            ),

            const SizedBox(
              height: 16,
            ),

            // row 2 of two containers
            Row(
              children: const [
                CategorySquare(
                    catText: 'Housing', icon: 'house', page: "resources"),
                SizedBox(
                  width: 16,
                ),
                CategorySquare(
                    catText: 'Domestic Violence & Sexual Assault',
                    icon: 'shield',
                    page: "resources"),
              ],
            ),

            const SizedBox(
              height: 16,
            ),

            const ResourceNavCard(
              title: "All Resources",
              page: "resources",
            ),

            const SizedBox(
              height: 16,
            ),
            // Adding option to see all resources available
            const ResourceNavCard(
              title: "Donations",
              page: "donations",
              urlHost: "www.callblackline.com",
              urlFragment: "donate",
              prefixIcon: "donation",
            ),

            const SizedBox(
              height: 32,
            ),
          ]),
        )));
  }
}
