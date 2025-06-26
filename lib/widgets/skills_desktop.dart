import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/constants/skills_item.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      constraints: const BoxConstraints(minHeight: 600),
      child: Column(
        children: [
          // Animated title
          AnimationConfiguration.staggeredList(
            position: 0,
            duration: const Duration(milliseconds: 800),
            child: SlideAnimation(
              verticalOffset: 50,
              child: FadeInAnimation(
                child: Column(
                  children: [
                    Text(
                      "My Skills",
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "FreshMulberryDemo",
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: CustomColor.yellowPrimary.withOpacity(0.5),
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 150,
                      height: 4,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            CustomColor.yellowPrimary,
                            Colors.transparent,
                          ],
                          stops: const [0.2, 1.0],
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          
          // Main content with proper constraints
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: AnimationConfiguration.staggeredList(
              position: 1,
              duration: const Duration(milliseconds: 800),
              child: SlideAnimation(
                verticalOffset: 30,
                child: FadeInAnimation(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Platforms Section
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, bottom: 20),
                              child: Text(
                                "Platform Expertise",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  color: CustomColor.yellowPrimary,
                                  fontFamily: "FreshMulberryDemo",
                                ),
                              ),
                            ),
                            Container(
                              constraints: const BoxConstraints(maxHeight: 500),
                              child: AnimationLimiter(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: plateformItems.length,
                                  itemBuilder: (context, index) {
                                    return AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration: const Duration(milliseconds: 500),
                                      child: SlideAnimation(
                                        verticalOffset: 30,
                                        child: FadeInAnimation(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 10),
                                            child: MouseRegion(
                                              child: AnimatedContainer(
                                                duration: const Duration(milliseconds: 300),
                                                height: 90,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      CustomColor.bglight2.withOpacity(0.1),
                                                      CustomColor.bglight2.withOpacity(0.2),
                                                    ],
                                                  ),
                                                  borderRadius: BorderRadius.circular(15),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: CustomColor.yellowPrimary.withOpacity(0.1),
                                                      blurRadius: 20,
                                                      spreadRadius: 2,
                                                      offset: const Offset(0, 5),
                                                    ),
                                                  ],
                                                  border: Border.all(
                                                    color: CustomColor.yellowPrimary.withOpacity(0.3),
                                                    width: 1.5,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 25),
                                                  child: Row(
                                                    children: [
                                                      // Platform icon with glow
                                                      AnimatedContainer(
                                                        duration: const Duration(milliseconds: 300),
                                                        padding: const EdgeInsets.all(12),
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.white.withOpacity(0.1),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: CustomColor.yellowPrimary.withOpacity(0.3),
                                                              blurRadius: 10,
                                                              spreadRadius: 2,
                                                            ),
                                                          ],
                                                        ),
                                                        child: Image.asset(
                                                          plateformItems[index]["img"],
                                                          width: 36,
                                                          height: 36,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 25),
                                                      Expanded(
                                                        child: Text(
                                                          plateformItems[index]["title"],
                                                          style: const TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.white,
                                                            fontFamily: "FreshMulberryDemo",
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      // Animated progress bar
                                                      AnimatedContainer(
                                                        duration: const Duration(milliseconds: 1000),
                                                        width: 100,
                                                        height: 8,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          gradient: const LinearGradient(
                                                            colors: [
                                                             Colors.yellow,
                                                              Colors.orange,
                                                            ],
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: CustomColor.yellowPrimary.withOpacity(0.3),
                                                              blurRadius: 5,
                                                              spreadRadius: 1,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
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
                          ],
                        ),
                      ),
                      
                      const SizedBox(width: 40),
                      
                      // Technical Skills Section
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, bottom: 20),
                              child: Text(
                                "Technical Skills",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  color: CustomColor.yellowPrimary,
                                  fontFamily: "FreshMulberryDemo",
                                ),
                              ),
                            ),
                            Container(
                              constraints: const BoxConstraints(maxHeight: 800),
                              child: AnimationLimiter(
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 1.3,
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing: 15,
                                  ),
                                  itemCount: skillsItem.length,
                                  itemBuilder: (context, index) {
                                    return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      duration: const Duration(milliseconds: 500),
                                      columnCount: 3,
                                      child: ScaleAnimation(
                                        child: FadeInAnimation(
                                          child: MouseRegion(
                                            child: AnimatedContainer(
                                              duration: const Duration(milliseconds: 300),
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    CustomColor.bglight2.withOpacity(0.1),
                                                    CustomColor.bglight2.withOpacity(0.2),
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black.withOpacity(0.2),
                                                    blurRadius: 10,
                                                    spreadRadius: 1,
                                                    offset: const Offset(0, 3),
                                                  ),
                                                ],
                                                border: Border.all(
                                                  color: Colors.white.withOpacity(0.1),
                                                  width: 1,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  // Skill icon with pulse animation
                                                  AnimatedContainer(
                                                    duration: const Duration(milliseconds: 500),
                                                    padding: const EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white.withOpacity(0.05),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.white.withOpacity(0.1),
                                                          blurRadius: 5,
                                                          spreadRadius: 1,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Image.asset(
                                                      skillsItem[index]["img"],
                                                      width: 40,
                                                      height: 40,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 12),
                                                  Text(
                                                    skillsItem[index]["title"],
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                      fontFamily: "FreshMulberryDemo",
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  // Animated proficiency dots
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: List.generate(
                                                      5,
                                                      (dotIndex) => Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 3),
                                                        child: AnimatedContainer(
                                                          duration: Duration(milliseconds: 300 + (dotIndex * 100)),
                                                          width: 8,
                                                          height: 8,
                                                          decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: dotIndex < 4
                                                                ? CustomColor.yellowPrimary
                                                                : Colors.white.withOpacity(0.2),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}