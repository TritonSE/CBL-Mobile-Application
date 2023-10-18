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
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                const BorderRadius.all(Radius.circular(16)),
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
            prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: (){},
                color: primaryVarColor,
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.cancel, size: 16.0),
              onPressed: (){
                textarea.clear();
                FocusScope.of(context).requestFocus(FocusNode());
              },
              color: primaryVarColor,
            ),
            hintText: 'Search something',
            border: InputBorder.none,
          ),
        )
      )
    );
  }
}