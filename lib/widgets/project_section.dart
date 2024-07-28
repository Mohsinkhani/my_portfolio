import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/utils/project_utils.dart';
import 'package:myportfolio/widgets/project_card.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          //work project title
          Text(
            "Work Projects",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary),
          ),
          SizedBox(
            height: 20,
          ),
          //work project card
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < workProjectUtils.length; i++)
                  projectcardwidget(project: workProjectUtils[i]),
              ],
            ),
          ),
          //hobby project card
          const SizedBox(
            height: 80,
          ),
          Text(
            "hobby Projects",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary),
          ),
          SizedBox(
            height: 20,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < hobbyProjectUtils.length; i++)
                  projectcardwidget(project: hobbyProjectUtils[i]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
