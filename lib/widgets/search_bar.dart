import 'package:flutter/material.dart';
import 'package:call_black_line/pages/resources.dart';

class SearchBar extends StatelessWidget {

  Widget build(BuildContext context) {
    final TextEditingController textarea = TextEditingController();
    return Container(
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.all(const Radius.circular(16)),
            border: Border.all(
                color: primaryVarColor,
                width: 1,
            ),
        ),
      child: Center(
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
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              color: primaryVarColor,
            ),
            hintText: 'Search Something',
            border: InputBorder.none,

          ),
        )
      )
    );
  }
}
