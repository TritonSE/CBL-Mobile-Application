import 'package:call_black_line/widgets/cbl.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final String currentPage;

  const CustomNavBar({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(CBL.aARGB, CBL.rARGB, CBL.gARGB, CBL.bARGB),
              spreadRadius: CBL.barRadius,
              blurRadius: CBL.barRadius)
        ],
      ),
      child: BottomAppBar(
        child: SizedBox(
          height: CBL.barHeight,
          // width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                text: "Resources",
                icon: Icons.format_list_bulleted,
                isCurrentPage: currentPage == 'Resources',
                onPressed: () => {
                  // Navigator.pushNamed(context, '/resources')
                },
              ),
              NavItem(
                text: "Seek Help",
                icon: Icons.chat_bubble,
                isCurrentPage: currentPage == 'Seek Help',
                onPressed: () => {
                  // Navigator.pushNamed(context, '/seekHelp')
                },
              ),
              NavItem(
                text: "Profile",
                icon: Icons.person,
                isCurrentPage: currentPage == 'Profile',
                onPressed: () => {
                  // Navigator.pushNamed(context, '/profile')
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isCurrentPage;
  final Function() onPressed;
  const NavItem(
      {super.key,
      required this.text,
      required this.icon,
      required this.isCurrentPage,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 5,
                    width: CBL.navItemWidth,
                    decoration: BoxDecoration(
                      color: isCurrentPage
                          ? Color(CBL.primaryOrange)
                          : Colors.transparent,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(CBL.borderRadiusSmall),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Center(
                    child: Column(
                  children: [
                    const SizedBox(
                      height: CBL.itemHeight,
                    ),
                    SizedBox(
                      height: CBL.checkboxDimensions,
                      child: Icon(
                        icon,
                        color: Color(CBL.primaryOrange),
                      ),
                    ),
                    const SizedBox(
                      height: CBL.boxHeightSmall,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                          color: isCurrentPage
                              ? Color(CBL.primaryOrange)
                              : Color(CBL.black),
                          fontFamily: CBL.fontFamily,
                          fontSize: CBL.fontSizeSmall,
                          fontWeight: CBL.bold),
                    ),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
