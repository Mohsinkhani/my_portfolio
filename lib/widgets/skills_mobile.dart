import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/constants/skills_item.dart';

class SkillsMobile extends StatefulWidget {
  const SkillsMobile({super.key});

  @override
  _SkillsMobileState createState() => _SkillsMobileState();
}

class _SkillsMobileState extends State<SkillsMobile> {
  bool isPlatformVisible = false;
  bool isSkillsVisible = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1.sw),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Platform section
            VisibilityDetector(
              key: const Key("platform_section"),
              onVisibilityChanged: (visibilityInfo) {
                if (visibilityInfo.visibleFraction > 0.2) {
                  setState(() {
                    isPlatformVisible = true;
                  });
                }
              },
              child: AnimatedOpacity(
                opacity: isPlatformVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: 0.95.sw, maxHeight: 300, minWidth: 300),
                  child: AnimationLimiter(
                    child: ListView.builder(
                      shrinkWrap: true, 
                      physics: const NeverScrollableScrollPhysics(),
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
                                        color: CustomColor.bglight2
                                            .withOpacity(0.2),
                                      )
                                    ],
                                    color: CustomColor.bglight2
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 20,
                                    ),
                                    leading: Image.asset(
                                        plateformItems[index]["img"]),
                                    title: Text(
                                      plateformItems[index]["title"],
                                      style: TextStyle(
                                          fontFamily: "FreshMulberryDemo"),
                                    ),
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
              ),
            ),
            const SizedBox(height: 50),
            // Skills section
            VisibilityDetector(
              key: const Key("skills_section"),
              onVisibilityChanged: (visibilityInfo) {
                if (visibilityInfo.visibleFraction > 0.2) {
                  setState(() {
                    isSkillsVisible = true;
                  });
                }
              },
              child: AnimatedOpacity(
                opacity: isSkillsVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: 0.95.sw, maxHeight: 500, minWidth: 100),
                  child: AnimationLimiter(
                    child: GridView.builder(
                      shrinkWrap: true, 
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 3),
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
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: CustomColor.bglight2
                                            .withOpacity(0.2),
                                      )
                                    ],
                                    color: CustomColor.bglight2
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 18),
                                        child: Image.asset(
                                          skillsItem[index]["img"],
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(
                                          skillsItem[index]["title"],
                                          style: TextStyle(
                                              fontFamily: "FreshMulberryDemo"),
                                        ),
                                      )),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
