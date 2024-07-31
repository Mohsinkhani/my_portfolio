import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/utils/project_utils.dart';
import 'dart:js' as js;

class projectcardwidget extends StatelessWidget {
  const projectcardwidget({super.key, required this.project});
  final ProjectUtils project;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 295,
      width: 265,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: CustomColor.bglight2,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            project.image,
            height: 155,
            width: 265,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              project.title,
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: CustomColor.whitePrimary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              project.subtitle,
              maxLines: 3,
              style: TextStyle(
                fontSize: 10,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          const Spacer(),
          //footer
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            color: CustomColor.bglight1,
            child: Row(
              children: [
                Text(
                  "available on",
                  style: TextStyle(
                      color: CustomColor.yellowSecondary, fontSize: 10),
                ),
                Spacer(),
                if (project.androidLink != null)
                  InkWell(
                    onTap: () {
                      js.context.callMethod("open", [project.androidLink]);
                    },
                    child: Image.asset(
                      "assets/images/android.png",
                      width: 19,
                    ),
                  ),
                if (project.iosLink != null)
                  InkWell(
                    onTap: () {
                      js.context.callMethod("open", [project.iosLink]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Image.asset(
                        "assets/images/ios.png",
                        width: 17,
                      ),
                    ),
                  ),
                if (project.weblink != null)
                  InkWell(
                    onTap: () {
                      js.context.callMethod("open", [project.weblink]);
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
    );
  }
}
