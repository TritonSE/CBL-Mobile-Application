import 'package:call_black_line/widgets/cbl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourceNavCard extends StatelessWidget {
  final String title;
  final String prefixIcon;
  final String suffixIcon;
  final String page;
  final String urlHost;
  final String urlFragment;
  const ResourceNavCard({
    Key? key,
    required this.title,
    required this.page,
    this.prefixIcon = '',
    this.suffixIcon = '',
    this.urlHost = '',
    this.urlFragment = '',
  }) : super(key: key);

  // Use fragment to support donate fragment identifier in https://www.callblackline.com/#donate
  Future<void> _launchUrl(String url, String fragment) async {
    final Uri uri = Uri(
      scheme: "https",
      host: url,
      fragment: fragment,
    );

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch url');
    }
  }

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment alignment = MainAxisAlignment.spaceBetween;
    if (prefixIcon != "") {
      alignment = MainAxisAlignment.start;
    }
    return GestureDetector(
      child: Container(
        height: 67,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(color: Color(CBL.lightGray)),
          boxShadow: const [CBL.boxShadow],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: alignment,
            children: [
              if (prefixIcon != '')
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    'assets/icons/$prefixIcon.svg',
                  ),
                ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              if (suffixIcon != '')
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    'assets/icons/$suffixIcon.svg',
                  ),
                ),
            ],
          ),
        ),
      ),
      onTap: () {
        if (urlHost != '') {
          _launchUrl(urlHost, urlFragment);
        } else if (page != '') {
          Navigator.pushNamed(context, '/$page');
        }
      },
    );
  }
}
