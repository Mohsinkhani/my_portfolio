import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/utils/project_utils.dart';

class ProjectCardWidget extends StatefulWidget {
  const ProjectCardWidget({super.key, required this.project});

  final ProjectUtils project;

  @override
  State<ProjectCardWidget> createState() => _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends State<ProjectCardWidget> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            isHovering = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHovering = false;
          });
        },
        child: AnimatedContainer(
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 1500),
          clipBehavior: Clip.antiAlias,
          height: isHovering ? 320 : 295,
          width: isHovering ? 295 : 265,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            color: Colors.black54.withOpacity(0.1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 1500),
                height: 155,
                width: isHovering ? 295 : 265,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          widget.project.image,
                        ),
                        fit: BoxFit.contain)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
                child: Text(
                  widget.project.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: Text(
                  widget.project.subtitle,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 10,
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ),
              const Spacer(),
              // footer
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                color: CustomColor.bglight1,
                child: Row(
                  children: [
                    Text(
                      "available on",
                      style: TextStyle(
                          color: CustomColor.yellowSecondary, fontSize: 10),
                    ),
                    const Spacer(),
                    if (widget.project.androidLink != null)
                      InkWell(
                        onTap: () {
                          js.context
                              .callMethod("open", [widget.project.androidLink]);
                        },
                        child: Image.asset(
                          "assets/images/android.png",
                          width: 19,
                        ),
                      ),
                    if (widget.project.iosLink != null)
                      InkWell(
                        onTap: () {
                          js.context
                              .callMethod("open", [widget.project.iosLink]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Image.asset(
                            "assets/images/ios.png",
                            width: 17,
                          ),
                        ),
                      ),
                    if (widget.project.weblink != null)
                      InkWell(
                        onTap: () {
                          js.context
                              .callMethod("open", [widget.project.weblink]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Image.asset(
                            "assets/images/web.png",
                            width: 17,
                          ),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
