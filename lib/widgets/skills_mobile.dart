import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/constants/skills_item.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        children: [
          for (int i = 0; i < plateformItems.length; i++)
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: CustomColor.bglight2,
                  borderRadius: BorderRadius.circular(5)),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                leading: Image.asset(
                  plateformItems[i]["img"],
                  width: 26,
                ),
                title: Text(plateformItems[i]["title"]),
              ),
            ),
          //skills
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < skillsItem.length; i++)
                Chip(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  backgroundColor: CustomColor.bglight2,
                  label: Text(skillsItem[i]["title"]),
                  avatar: Image.asset(skillsItem[i]["img"]),
                )
            ],
          ),
        ],
      ),
    );
  }
}
