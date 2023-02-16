import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentPage;
  const CustomNavBar({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(45, 206, 201, 201),
              spreadRadius: 5,
              blurRadius: 5)
        ],
      ),
      child: BottomAppBar(
        child: SizedBox(
          height: 82,
          // width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                text: "Resources",
                icon: Icons.format_list_bulleted,
                isCurrentPage: currentPage == 0,
                onPressed: () => {
                  // Navigator.pushNamed(context, '/resources')
                },
              ),
              NavItem(
                text: "Seek Help",
                icon: Icons.chat_bubble,
                isCurrentPage: currentPage == 1,
                onPressed: () => {
                  // Navigator.pushNamed(context, '/seekhelp')
                },
              ),
              NavItem(
                text: "Profile",
                icon: Icons.person,
                isCurrentPage: currentPage == 2,
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
    int primaryOrange = int.parse('#DF742C'.replaceAll('#', '0xff'));
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
                    width: 100,
                    decoration: BoxDecoration(
                      color: isCurrentPage
                          ? Color(primaryOrange)
                          : Colors.transparent,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
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
                      height: 15,
                    ),
                    SizedBox(
                      height: 24,
                      child: Icon(
                        icon,
                        color: Color(primaryOrange),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                          color: isCurrentPage
                              ? Color(primaryOrange)
                              : Colors.black,
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
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
