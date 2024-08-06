import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/constants/skills_item.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //plateform
        SizedBox(
          // color: Colors.black,
          height: 500,
          width: 500,
          child: AnimationLimiter(
            child: ListView.builder(
              itemCount: plateformItems.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 1500),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 5),
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: CustomColor.bglight2.withOpacity(0.2),
                              )
                            ],
                            color: CustomColor.bglight2.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            leading: Image.asset(plateformItems[index]["img"]),
                            title: Text(plateformItems[index]["title"]),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          width: 50,
        ),

        SizedBox(
          // color: Colors.black,
          height: 300,
          width: 550,
          child: AnimationLimiter(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,childAspectRatio: 3),
              itemCount: skillsItem.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 1500),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 5),
                        child: Container(
                          height: 50,
                          // width: 200,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: CustomColor.bglight2.withOpacity(0.2),
                              )
                            ],
                            color: CustomColor.bglight2.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                          ),

                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Image.asset(
                                  skillsItem[index]["img"],
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              Expanded(child: Text(skillsItem[index]["title"])),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
       ],
    );
  }
}
