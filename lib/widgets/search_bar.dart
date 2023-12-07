import 'package:flutter/material.dart';
import 'package:call_black_line/pages/resources.dart';

/*
 * This file contains the search bar widget for the first page 
 * of the resources flow 
 */

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textarea = TextEditingController();
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: primaryVarColor,
          width: 1,
        ),
      ),
      child: Center(
        // Adds the attribute of typing into the search bar
        child: TextField(
          controller: textarea,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 16),
            prefixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
              color: primaryVarColor,
            ),
            hintText: 'Search resources...',
            hintStyle: TextStyle(fontSize: 17),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
