import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/constants/skills_item.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //plateform
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 450),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              for (int i = 0; i < plateformItems.length; i++)
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: CustomColor.bglight2,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    leading: Image.asset(plateformItems[i]["img"]),
                    title: Text(plateformItems[i]["title"]),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          width: 50,
        ),
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (int i = 0; i < skillsItem.length; i++)
                  Chip(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    backgroundColor: CustomColor.bglight2,
                    label: Text(skillsItem[i]["title"]),
                    avatar: Image.asset(skillsItem[i]["img"]),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
