import 'package:call_black_line/widgets/cbl.dart';
import 'package:call_black_line/widgets/orange_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourceCard extends StatefulWidget {
  final String title;
  final String description;
  final String category;
  final String link;

  const ResourceCard({
    Key? key,
    required this.title,
    required this.description,
    required this.category,
    required this.link,
  }) : super(key: key);

  @override
  State<ResourceCard> createState() => _ResourceCardState();
}

class _ResourceCardState extends State<ResourceCard>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController rotationController;

  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        child: AnimatedSize(
          duration: const Duration(milliseconds: 150),
          alignment: Alignment.topCenter,
          child: Container(
            height: isExpanded ? null : 105,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              border: Border.all(color: Color(CBL.lightGray)),
              boxShadow: const [CBL.boxShadow],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.85,
                    alignment: Alignment.centerLeft,
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      final textPainter = TextPainter(
                        text: TextSpan(
                            text: widget.title,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                        maxLines: 1,
                        textDirection: TextDirection.ltr,
                      )..layout(maxWidth: constraints.maxWidth);

                      bool isOverflowing = textPainter.didExceedMaxLines;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            widget.title,
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          ...(!isOverflowing | isExpanded
                              ? [
                                  Text(
                                    widget.description,
                                    textAlign: TextAlign.left,
                                    maxLines: isExpanded ? null : 2,
                                    overflow: isExpanded
                                        ? null
                                        : TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inter',
                                        color: Colors.black),
                                  )
                                ]
                              : []),
                          if (isExpanded)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: OrangeButton(
                                    buttonText: "View Website",
                                    width: 161.0,
                                    fontSize: 17,
                                    onTap: () => {_launchUrl(widget.link)}),
                              ),
                            )
                        ],
                      );
                    }),
                  ),
                  Positioned(
                    right: 10.0,
                    top: 20.0,
                    child: RotationTransition(
                      turns: Tween(begin: 0.0, end: 0.5)
                          .animate(rotationController),
                      child: SvgPicture.asset(
                        'assets/icons/expand_arrow.svg',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
            isExpanded
                ? rotationController.forward()
                : rotationController.reverse();
          });
        },
      ),
    );
  }
}
