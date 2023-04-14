import 'package:flutter/material.dart';
import '../auth_methods.dart';

typedef void BackButtonCallback();

class Header extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;
  final BackButtonCallback onBackButtonPressed;

  const Header(
      {Key? key, this.isHome = false, required this.onBackButtonPressed})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.of(context).size.width;

    var logoHeight = 35.0;
    if (mediaWidth < 400) {
      logoHeight = mediaWidth / 15;
    }
    return AppBar(
      leading: !isHome
          ? Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xffDF742C),
                  size: 30,
                ),
                onPressed: onBackButtonPressed,
                //add callback instance variable, pass in behavior
                //for mvp, we can also shoehorn 2 options for login vs not logged in
              ),
            )
          : null,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.2),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/call-blackline-black.png',
              height: logoHeight)
        ],
      ),
    );
  }
}
