import 'package:flutter/material.dart';
import 'package:call_black_line/pages/resources.dart';

class SearchBar extends StatelessWidget {

  Widget build(BuildContext context) {
    return Container(
        height: 38,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.all(const Radius.circular(16)),
            border: Border.all(
                color: primaryVarColor,
                width: 1,
            ),
        ),
        child: Padding(
            padding: const EdgeInsets.only(
                left: 18.75, right: 17.33, top: 8.0, bottom: 8.0,
            ),
            child: Row(
                children: [
                    SizedBox(
                        width: 16.03,
                        height: 16.03,
                        child: const Icon(
                            Icons.search,
                            color: primaryVarColor,
                        )
                    ),
                    SizedBox(
                        width: 11.22,
                    ),
                    Expanded(
                        child: const Text(
                            'Search something',
                            style: const TextStyle(
                                fontSize: 17,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                color: secondaryTextColor
                            ),
                        ),
                    ),
                    SizedBox(
                        width: 13.33,
                        height: 13.33,
                        child: const Icon(
                            Icons.cancel,
                            color: primaryVarColor,
                        ),
                    ),
                ]
            ),
        ),
    );
  }
}
