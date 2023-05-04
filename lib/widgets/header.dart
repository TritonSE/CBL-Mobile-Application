import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/cbl.dart';


class Header extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;

  const Header({Key? key, this.isHome = false}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.of(context).size.width;

    var logoHeight = CBL.logoHeight;
    if (mediaWidth < CBL.smallMediaWidth) {
      logoHeight = mediaWidth / CBL.logoScalar;
    }
    return AppBar(
      leading: !isHome
          ? Padding(
              padding: const EdgeInsets.only(left: CBL.largePadding),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(CBL.orange),
                  size: CBL.iconSize,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            )
          : null,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(CBL.blackOpacity),
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
